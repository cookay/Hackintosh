/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20100331
 *
 * Disassembly of iASLMUUr3S.aml, Mon Mar 21 22:34:38 2016
 *
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000015E2 (5602)
 *     Revision         0x01
 *     Checksum         0x46
 *     OEM ID           "OptRef"
 *     OEM Table ID     "OptTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120711 (538052369)
 */
DefinitionBlock ("iASLMUUr3S.aml", "SSDT", 1, "OptRef", "OptTabl", 0x00001000)
{
    External (HYSS, FieldUnitObj)
    External (P80H, FieldUnitObj)
    External (PNOT, MethodObj)    // 0 Arguments
    External (OEMF, FieldUnitObj)
    External (GPSC, FieldUnitObj)
    External (NVGA, FieldUnitObj)
    External (SGOF, MethodObj)    // 0 Arguments
    External (SGON, MethodObj)    // 0 Arguments
    External (P8XH, MethodObj)    // 2 Arguments
    External (N16F, FieldUnitObj)
    External (PSEL, FieldUnitObj)
    External (DSEL, FieldUnitObj)
    External (SGPI, MethodObj)    // 1 Arguments
    External (ESEL, FieldUnitObj)
    External (SGPO, MethodObj)    // 2 Arguments
    External (NVHA, FieldUnitObj)
    External (EBAS, FieldUnitObj)
    External (\_SB_.OSCO, IntObj)
    External (\_PR_.CPU0, ProcessorObj)
    External (\_SB_.PCI0, DeviceObj)
    External (\_SB_.PCI0.PEG0, DeviceObj)
    External (\_PR_.CPU0._PTC)
    External (\_PR_.CPU0._TSS, IntObj)
    External (\_SB_.AC__.ADJP, MethodObj)    // 1 Arguments
    External (\_PR_.CPU0._PPC, IntObj)
    External (\_SB_.AC__.ACFG, IntObj)
    External (\_PR_.CPU0._PSS, PkgObj)
    External (\_SB_.PCI0.GFX0, DeviceObj)
    External (\_SB_.PCI0.GFX0._DSM, IntObj)
    External (\_SB_.PCI0.PEG0.RTLK, FieldUnitObj)
    External (\_SB_.PCI0.PEG0.LNKS, FieldUnitObj)
    External (\_SB_.PCI0.PEG0.LNKD, FieldUnitObj)
    External (\_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (\_SB_.PCI0.LPCB.EC__.DGPU, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.FCMD, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.FDAT, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.N16C, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.GTVR, FieldUnitObj)
    External (\_SB_.PCI0.PEG0.PEGP.SGOF, MethodObj)    // 0 Arguments
    External (\_SB_.PCI0.PEG0.PEGP.SGON, MethodObj)    // 0 Arguments
    External (\_SB_.PCI0.PEG0.PEGP.SGST, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0)
    {
        Name (OTM, "OTMACPI 2010-Mar-09 12:08:26")
    }

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        OperationRegion (PCI2, SystemMemory, EBAS, 0x0500)
        Field (PCI2, DWordAcc, Lock, Preserve)
        {
                    Offset (0x04), 
            CMDR,   32, 
            VGAR,   1984, 
                    Offset (0x488), 
                ,   25, 
            NHDM,   1
        }

        Name (VGAB, Buffer (0xF8)
        {
            0x00
        })
        Name (GPRF, Zero)
        OperationRegion (NVHM, SystemMemory, NVHA, 0x00020400)
        Field (NVHM, DWordAcc, NoLock, Preserve)
        {
            NVSG,   128, 
            NVSZ,   32, 
            NVVR,   32, 
            NVHO,   32, 
            RVBS,   32, 
            RBF1,   262144, 
            RBF2,   262144, 
            RBF3,   262144, 
            RBF4,   262144, 
            MXML,   32, 
            MXM3,   1600
        }

        Name (OPCE, 0x02)
        Name (OPTF, One)
        Name (DGPS, Zero)
        Name (_PSC, Zero)
        Method (_PS0, 0, NotSerialized)
        {
            Store (Zero, _PSC)
            If (LNotEqual (DGPS, Zero))
            {
                _ON ()
                Store (Zero, DGPS)
            }
        }

        Method (_PS1, 0, NotSerialized)
        {
            Store (One, _PSC)
        }

        Method (_PS3, 0, NotSerialized)
        {
            If (LEqual (OPCE, 0x03))
            {
                If (LEqual (DGPS, Zero))
                {
                    _OFF ()
                    Store (One, DGPS)
                }

                Store (0x02, OPCE)
            }

            Store (0x03, _PSC)
        }

        Method (_STA, 0, NotSerialized)
        {
            Return (0x0F)
        }

        Method (_IRC, 0, Serialized)
        {
            Return (Zero)
        }

        Method (MXMX, 1, Serialized)
        {
            If (LEqual (Arg0, Zero))
            {
                SGPO (ESEL, One)
                Return (One)
            }

            If (LEqual (Arg0, One))
            {
                Return (One)
            }

            If (LEqual (Arg0, 0x02))
            {
                Return (SGPI (ESEL))
            }

            Return (Zero)
        }

        Method (MXDS, 1, Serialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Return (SGPI (DSEL))
            }
            Else
            {
                SGPO (DSEL, One)
                SGPO (PSEL, One)
            }

            Return (Zero)
        }

        Method (_ROM, 2, NotSerialized)
        {
            Store (Arg0, Local0)
            Store (Arg1, Local1)
            If (LGreater (Local1, 0x1000))
            {
                Store (0x1000, Local1)
            }

            If (LGreater (Local0, 0x00020000))
            {
                Return (Buffer (Local1)
                {
                    0x00
                })
            }

            Multiply (Local1, 0x08, Local3)
            Name (ROM1, Buffer (0x8000)
            {
                0x00
            })
            Name (ROM2, Buffer (Local1)
            {
                0x00
            })
            If (LLess (Local0, 0x8000))
            {
                Store (RBF1, ROM1)
            }
            Else
            {
                If (LLess (Local0, 0x00010000))
                {
                    Subtract (Local0, 0x8000, Local0)
                    Store (RBF2, ROM1)
                }
                Else
                {
                    If (LLess (Local0, 0x00018000))
                    {
                        Subtract (Local0, 0x00010000, Local0)
                        Store (RBF3, ROM1)
                    }
                    Else
                    {
                        If (LLess (Local0, 0x00020000))
                        {
                            Subtract (Local0, 0x00018000, Local0)
                            Store (RBF4, ROM1)
                        }
                    }
                }
            }

            Multiply (Local0, 0x08, Local2)
            CreateField (ROM1, Local2, Local3, TMPB)
            Store (TMPB, ROM2)
            Return (ROM2)
        }

        Method (GMXM, 3, NotSerialized)
        {
            Store (0xC8, Local0)
            Name (BUMA, Buffer (Local0) {})
            If (CondRefOf (MXM3, Local6))
            {
                Store (MXM3, BUMA)
            }

            Store (Zero, Local1)
            Store (Zero, Local5)
            While (One)
            {
                Add (Local1, 0x06, Local2)
                Store (DerefOf (Index (BUMA, Local2)), Local3)
                If (Local3)
                {
                    Add (Local3, 0x08, Local3)
                }
                Else
                {
                    Break
                }

                Store (Local1, Local4)
                Add (Local4, 0x04, Local4)
                If (LEqual (DerefOf (Index (BUMA, Local4)), Arg0))
                {
                    Increment (Local4)
                    If (LEqual (DerefOf (Index (BUMA, Local4)), Arg1))
                    {
                        If (LEqual (Local5, Arg2))
                        {
                            Multiply (Local1, 0x08, Local1)
                            Multiply (Local3, 0x08, Local3)
                            CreateField (BUMA, Local1, Local3, TMPB)
                            Return (TMPB)
                        }
                        Else
                        {
                            Increment (Local5)
                        }
                    }
                }

                Add (Local1, Local3, Local1)
                If (LGreater (Local1, Local0))
                {
                    Break
                }
            }

            Return (Buffer (0x08)
            {
                0x00
            })
        }

        Method (HDSM, 4, Serialized)
        {
            Name (_T_0, Zero)
            If (LEqual (Arg0, Buffer (0x10)
                    {
                        /* 0000 */    0x00, 0xA4, 0x04, 0x40, 0x7D, 0x91, 0xF2, 0x4C, 
                        /* 0008 */    0xB8, 0x9C, 0x79, 0xB6, 0x2F, 0xD5, 0x56, 0x65
                    }))
            {
                While (One)
                {
                    Store (ToInteger (Arg2), _T_0)
                    If (LEqual (_T_0, Zero))
                    {
                        Return (Buffer (0x04)
                        {
                            0x01, 0x00, 0x01, 0x01
                        })
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x18))
                        {
                            Return (Unicode ("0"))
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x10))
                            {
                                If (LEqual (N16F, One))
                                {
                                    Name (MXM1, Buffer (0x25)
                                    {
                                        /* 0000 */    0x4D, 0x58, 0x4D, 0x5F, 0x03, 0x00, 0x1D, 0x00, 
                                        /* 0008 */    0x01, 0xBA, 0x04, 0x00, 0x03, 0x03, 0x8A, 0x02, 
                                        /* 0010 */    0x13, 0x02, 0xBA, 0x04, 0x93, 0x00, 0x58, 0x02, 
                                        /* 0018 */    0xA3, 0x00, 0x26, 0x02, 0xB3, 0x00, 0xF4, 0x01, 
                                        /* 0020 */    0xC3, 0x00, 0xC2, 0x01, 0x85
                                    })
                                    Return (MXM1)
                                }
                                Else
                                {
                                    If (LEqual (N16F, 0x02))
                                    {
                                        Name (MXM2, Buffer (0x25)
                                        {
                                            /* 0000 */    0x4D, 0x58, 0x4D, 0x5F, 0x03, 0x00, 0x1D, 0x00, 
                                            /* 0008 */    0x01, 0xBA, 0x04, 0x00, 0x03, 0x03, 0x26, 0x02, 
                                            /* 0010 */    0x13, 0x02, 0xBA, 0x04, 0x93, 0x00, 0xF4, 0x01, 
                                            /* 0018 */    0xA3, 0x00, 0xC2, 0x01, 0xB3, 0x00, 0x90, 0x01, 
                                            /* 0020 */    0xC3, 0x00, 0x5E, 0x01, 0x7B
                                        })
                                        Return (MXM2)
                                    }
                                    Else
                                    {
                                        If (LEqual (N16F, 0x03))
                                        {
                                            Name (MXM3, Buffer (0x25)
                                            {
                                                /* 0000 */    0x4D, 0x58, 0x4D, 0x5F, 0x03, 0x00, 0x1D, 0x00, 
                                                /* 0008 */    0x01, 0xBA, 0x04, 0x00, 0x03, 0x03, 0x26, 0x02, 
                                                /* 0010 */    0x13, 0x02, 0xBA, 0x04, 0x93, 0x00, 0xF4, 0x01, 
                                                /* 0018 */    0xA3, 0x00, 0xC2, 0x01, 0xB3, 0x00, 0x90, 0x01, 
                                                /* 0020 */    0xC3, 0x00, 0x5E, 0x01, 0x7B
                                            })
                                            Return (MXM3)
                                        }
                                        Else
                                        {
                                            If (LEqual (N16F, Zero))
                                            {
                                                Name (MXM4, Buffer (0x15)
                                                {
                                                    /* 0000 */    0x4D, 0x58, 0x4D, 0x5F, 0x03, 0x00, 0x0D, 0x00, 
                                                    /* 0008 */    0x01, 0xBA, 0x04, 0x00, 0x03, 0x03, 0xC2, 0x01, 
                                                    /* 0010 */    0x13, 0x02, 0xBA, 0x04, 0x44
                                                })
                                                Return (MXM4)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Break
                }

                Return (0x80000002)
            }

            Return (0x80000001)
        }

        Method (_DSM, 4, Serialized)
        {
            CreateByteField (Arg0, 0x03, GUID)
            Return (\_SB.PCI0.GFX0.HDSM (Arg0, Arg1, Arg2, Arg3))
        }

        Name (CTXT, Zero)
        Method (_ON, 0, Serialized)
        {
            P8XH (Zero, 0x78)
            SGON ()
            Store (Zero, CMDR)
            Store (VGAB, VGAR)
            Store (0x00100006, CMDR)
            If (OPTF)
            {
                Store (Zero, NHDM)
            }
        }

        Method (_OFF, 0, Serialized)
        {
            P8XH (Zero, 0x76)
            If (LEqual (CTXT, Zero))
            {
                Store (VGAR, VGAB)
                Store (One, CTXT)
            }

            SGOF ()
        }
    }

    Scope (\_SB.PCI0.GFX0)
    {
        OperationRegion (NVIG, SystemMemory, NVGA, 0x0400)
        Field (NVIG, DWordAcc, NoLock, Preserve)
        {
            NISG,   128, 
            NISZ,   32, 
            NIVR,   32, 
            GPSS,   32, 
            GACD,   16, 
            GATD,   16, 
            LDES,   8, 
            DKST,   8, 
            DACE,   8, 
            DHPE,   8, 
            DHPS,   8, 
            SGNC,   8, 
            GPPO,   8, 
            USPM,   8, 
            GPSP,   8, 
            TLSN,   8, 
            DOSF,   8, 
            ELCL,   16
        }

        Method (HDSM, 4, Serialized)
        {
            If (LEqual (Arg0, Buffer (0x10)
                    {
                        /* 0000 */    0x01, 0x2D, 0x13, 0xA3, 0xDA, 0x8C, 0xBA, 0x49, 
                        /* 0008 */    0xA5, 0x2E, 0xBC, 0x9D, 0x46, 0xDF, 0x6B, 0x81
                    }))
            {
                Return (\_SB.PCI0.PEG0.PEGP.GPS (Arg0, Arg1, Arg2, Arg3))
            }

            Name (SGCI, Zero)
            Name (NBCI, Zero)
            Name (OPCI, Zero)
            Name (BUFF, Zero)
            If (LEqual (Arg0, Buffer (0x10)
                    {
                        /* 0000 */    0xF8, 0xD8, 0x86, 0xA4, 0xDA, 0x0B, 0x1B, 0x47, 
                        /* 0008 */    0xA7, 0x2B, 0x60, 0x42, 0xA6, 0xB5, 0xBE, 0xE0
                    }))
            {
                Store (One, OPCI)
            }

            If (LOr (OPCI, LOr (SGCI, NBCI)))
            {
                If (OPCI)
                {
                    If (LNotEqual (Arg1, 0x0100))
                    {
                        Return (0x80000002)
                    }
                }
                Else
                {
                    If (LNotEqual (Arg1, 0x0102))
                    {
                        Return (0x80000002)
                    }
                }

                If (LEqual (Arg2, Zero))
                {
                    If (SGCI)
                    {
                        Return (Buffer (0x04)
                        {
                            0x7F, 0x00, 0x04, 0x00
                        })
                    }
                    Else
                    {
                        If (NBCI)
                        {
                            Return (Buffer (0x04)
                            {
                                0x73, 0x00, 0x04, 0x00
                            })
                        }
                        Else
                        {
                            If (OPCI)
                            {
                                Return (Buffer (0x04)
                                {
                                    0x01, 0x18, 0x03, 0x0C
                                })
                            }
                        }
                    }
                }

                If (LEqual (Arg2, One))
                {
                    Name (TEMP, Buffer (0x04)
                    {
                        0x00, 0x00, 0x00, 0x00
                    })
                    CreateDWordField (TEMP, Zero, STS0)
                    If (SGCI)
                    {
                        Or (STS0, 0x0B0000BF, STS0)
                        Or (STS0, ShiftLeft (SGNC, 0x08, SGNC), STS0)
                    }
                    Else
                    {
                        Or (STS0, Zero, STS0)
                    }

                    Return (TEMP)
                }

                If (LEqual (Arg2, 0x02))
                {
                    Name (TMP1, Buffer (0x04)
                    {
                        0x00, 0x00, 0x00, 0x00
                    })
                    CreateDWordField (TMP1, Zero, STS1)
                    ToInteger (Arg3, Local0)
                    And (Local0, 0x1F, Local0)
                    If (And (Local0, 0x10))
                    {
                        And (Local0, 0x0F, Local0)
                        Store (Local0, GPSS)
                        Notify (\_SB.PCI0.GFX0, 0xD9)
                        Notify (\_SB.PCI0.WMI1, 0xD9)
                    }
                    Else
                    {
                        And (Local0, 0x0F, Local0)
                        If (LEqual (GPPO, One))
                        {
                            Store (GPSS, Local0)
                            Or (Local0, 0x10, Local0)
                            Store (Zero, GPPO)
                        }
                    }

                    Or (STS1, Local0, STS1)
                    Return (TMP1)
                }

                If (LEqual (Arg2, 0x03))
                {
                    Name (TMP2, Buffer (0x04)
                    {
                        0x00, 0x00, 0x00, 0x00
                    })
                    CreateDWordField (TMP2, Zero, STS2)
                    ToInteger (Arg3, Local0)
                    And (Local0, 0x03, Local0)
                    If (LEqual (Local0, Zero))
                    {
                        \_SB.PCI0.PEG0.PEGP.SGST ()
                    }

                    If (LEqual (Local0, One))
                    {
                        \_SB.PCI0.PEG0.PEGP.SGON ()
                    }

                    If (LEqual (Local0, 0x02))
                    {
                        \_SB.PCI0.PEG0.PEGP.SGOF ()
                    }

                    If (LEqual (\_SB.PCI0.PEG0.PEGP.SGST (), 0x0F))
                    {
                        Or (STS2, One, STS2)
                    }

                    Return (TMP2)
                }

                If (LEqual (Arg2, 0x04))
                {
                    Name (TMP3, Buffer (0x04)
                    {
                        0x00, 0x00, 0x00, 0x00
                    })
                    CreateDWordField (TMP3, Zero, STS3)
                    ToInteger (Arg3, Local0)
                    Store (Local0, Local1)
                    ShiftRight (Local0, 0x10, Local0)
                    And (Local0, One, USPM)
                    ShiftRight (Local1, 0x0D, Local1)
                    And (Local1, 0x03, Local1)
                    If (LNotEqual (Local1, GPSP))
                    {
                        If (LEqual (USPM, One))
                        {
                            Store (Local1, GPSP)
                        }
                        Else
                        {
                            Store (GPSP, Local1)
                            Or (STS3, 0x8000, STS3)
                        }
                    }

                    Or (STS3, ShiftLeft (Local1, 0x0D), STS3)
                    Return (TMP3)
                }

                If (LEqual (Arg2, 0x10))
                {
                    CreateWordField (Arg3, 0x02, USRG)
                    Name (OPVK, Buffer (0xE6)
                    {
                        /* 0000 */    0xE4, 0x42, 0x5F, 0x14, 0x36, 0x26, 0x16, 0x37, 
                        /* 0008 */    0x4B, 0x56, 0xE6, 0x00, 0x00, 0x00, 0x01, 0x00, 
                        /* 0010 */    0x31, 0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35, 
                        /* 0018 */    0x36, 0x39, 0x38, 0x35, 0x47, 0x65, 0x6E, 0x75, 
                        /* 0020 */    0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44, 
                        /* 0028 */    0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69, 
                        /* 0030 */    0x66, 0x69, 0x65, 0x64, 0x20, 0x4F, 0x70, 0x74, 
                        /* 0038 */    0x69, 0x6D, 0x75, 0x73, 0x20, 0x52, 0x65, 0x61, 
                        /* 0040 */    0x64, 0x79, 0x20, 0x4D, 0x6F, 0x74, 0x68, 0x65, 
                        /* 0048 */    0x72, 0x62, 0x6F, 0x61, 0x72, 0x64, 0x20, 0x66, 
                        /* 0050 */    0x6F, 0x72, 0x20, 0x37, 0x33, 0x36, 0x30, 0x31, 
                        /* 0058 */    0x39, 0x5F, 0x4D, 0x49, 0x52, 0x63, 0x20, 0x20, 
                        /* 0060 */    0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 
                        /* 0068 */    0x2D, 0x20, 0x3C, 0x34, 0x27, 0x21, 0x58, 0x29, 
                        /* 0070 */    0x57, 0x27, 0x58, 0x20, 0x27, 0x25, 0x59, 0x5D, 
                        /* 0078 */    0x31, 0x29, 0x3A, 0x2A, 0x26, 0x39, 0x59, 0x43, 
                        /* 0080 */    0x56, 0x3B, 0x58, 0x56, 0x58, 0x3D, 0x59, 0x4E, 
                        /* 0088 */    0x3B, 0x3A, 0x35, 0x44, 0x25, 0x42, 0x5A, 0x48, 
                        /* 0090 */    0x55, 0x3A, 0x58, 0x4C, 0x25, 0x48, 0x54, 0x21, 
                        /* 0098 */    0x35, 0x4B, 0x4D, 0x37, 0x2C, 0x3C, 0x20, 0x2D, 
                        /* 00A0 */    0x20, 0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67, 
                        /* 00A8 */    0x68, 0x74, 0x20, 0x32, 0x30, 0x31, 0x30, 0x20, 
                        /* 00B0 */    0x4E, 0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43, 
                        /* 00B8 */    0x6F, 0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69, 
                        /* 00C0 */    0x6F, 0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52, 
                        /* 00C8 */    0x69, 0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65, 
                        /* 00D0 */    0x73, 0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x31, 
                        /* 00D8 */    0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35, 0x36, 
                        /* 00E0 */    0x39, 0x38, 0x35, 0x28, 0x52, 0x29
                    })
                    If (LEqual (USRG, 0x564B))
                    {
                        Return (OPVK)
                    }

                    Return (Zero)
                }

                If (LEqual (Arg2, 0x11))
                {
                    Return (Zero)
                }

                If (LEqual (Arg2, 0x12))
                {
                    Return (Package (0x0A)
                    {
                        0xD0, 
                        Buffer (0x10)
                        {
                            /* 0000 */    0x40, 0x2F, 0x1A, 0x92, 0xC4, 0x0D, 0x2D, 0x40, 
                            /* 0008 */    0xAC, 0x18, 0xB4, 0x84, 0x44, 0xEF, 0x9E, 0xD2
                        }, 

                        0xD9, 
                        Buffer (0x10)
                        {
                            /* 0000 */    0x61, 0xD3, 0x2A, 0xC1, 0xA9, 0x9F, 0x74, 0x4C, 
                            /* 0008 */    0x90, 0x1F, 0x95, 0xCB, 0x09, 0x45, 0xCF, 0x3E
                        }, 

                        0xDB, 
                        Buffer (0x10)
                        {
                            /* 0000 */    0x06, 0x80, 0x84, 0x42, 0x86, 0x88, 0x0E, 0x49, 
                            /* 0008 */    0x8C, 0x72, 0x2B, 0xDC, 0xA9, 0x3A, 0x8A, 0x09
                        }, 

                        0xEF, 
                        Buffer (0x10)
                        {
                            /* 0000 */    0xD2, 0x85, 0xE4, 0xB3, 0xC1, 0x3C, 0x54, 0x4B, 
                            /* 0008 */    0x8F, 0x31, 0x77, 0xBA, 0x2F, 0xDC, 0x9E, 0xBE
                        }, 

                        0xF0, 
                        Buffer (0x10)
                        {
                            /* 0000 */    0xB6, 0x6F, 0x0D, 0x36, 0x4E, 0x1D, 0xA6, 0x4F, 
                            /* 0008 */    0xB8, 0x48, 0x1B, 0xE3, 0x3D, 0xD8, 0xEC, 0x7B
                        }
                    })
                }

                If (LEqual (Arg2, 0x1A))
                {
                    CreateField (Arg3, 0x18, 0x02, OMPR)
                    CreateField (Arg3, Zero, One, FLCH)
                    CreateField (Arg3, One, One, DVSR)
                    CreateField (Arg3, 0x02, One, DVSC)
                    If (ToInteger (FLCH))
                    {
                        Store (OMPR, \_SB.PCI0.PEG0.PEGP.OPCE)
                    }

                    Store (Buffer (0x04)
                        {
                            0x00, 0x00, 0x00, 0x00
                        }, Local0)
                    CreateField (Local0, Zero, One, OPEN)
                    CreateField (Local0, 0x03, 0x02, CGCS)
                    CreateField (Local0, 0x06, One, SHPC)
                    CreateField (Local0, 0x08, One, SNSR)
                    CreateField (Local0, 0x18, 0x03, DGPC)
                    CreateField (Local0, 0x1B, 0x02, HDAC)
                    Store (One, OPEN)
                    Store (One, SHPC)
                    Store (0x02, HDAC)
                    Store (One, DGPC)
                    If (ToInteger (DVSC))
                    {
                        If (ToInteger (DVSR))
                        {
                            Store (One, \_SB.PCI0.PEG0.PEGP.GPRF)
                        }
                        Else
                        {
                            Store (Zero, \_SB.PCI0.PEG0.PEGP.GPRF)
                        }
                    }

                    Store (\_SB.PCI0.PEG0.PEGP.GPRF, SNSR)
                    If (LNotEqual (\_SB.PCI0.PEG0.PEGP.SGST (), Zero))
                    {
                        Store (0x03, CGCS)
                    }

                    Return (Local0)
                }

                If (LEqual (Arg2, 0x1B))
                {
                    Store (Arg3, Local0)
                    CreateField (Local0, Zero, One, OPFL)
                    CreateField (Local0, One, One, OPVL)
                    If (ToInteger (OPVL))
                    {
                        Store (Zero, Local0)
                        If (ToInteger (OPFL))
                        {
                            Store (One, Local0)
                        }
                    }

                    Return (Local0)
                }

                Return (0x80000002)
            }

            Return (\_SB.PCI0.PEG0.PEGP.HDSM (Arg0, Arg1, Arg2, Arg3))
        }
    }

    Scope (\_SB.PCI0)
    {
        Name (GPS, "GPSACPI 2012-Aug-12 14:56:05")
    }

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        Name (PSAP, Zero)
        Name (ECBF, Buffer (0x14) {})
        CreateDWordField (ECBF, Zero, EDS1)
        CreateDWordField (ECBF, 0x04, EDS2)
        CreateDWordField (ECBF, 0x08, EDS3)
        CreateDWordField (ECBF, 0x0C, EDS4)
        CreateDWordField (ECBF, 0x10, EPDT)
        Name (GPSP, Buffer (0x24) {})
        CreateDWordField (GPSP, Zero, RETN)
        CreateDWordField (GPSP, 0x04, VRV1)
        CreateDWordField (GPSP, 0x08, TGPU)
        CreateDWordField (GPSP, 0x0C, PDTS)
        CreateDWordField (GPSP, 0x10, SFAN)
        CreateDWordField (GPSP, 0x14, SKNT)
        CreateDWordField (GPSP, 0x18, CPUE)
        CreateDWordField (GPSP, 0x1C, TMP1)
        CreateDWordField (GPSP, 0x20, TMP2)
        Name (NLIM, Zero)
        Name (PSCP, Zero)
        Method (GPS, 4, Serialized)
        {
            Name (_T_1, Zero)
            Name (_T_0, Zero)
            Store ("------- GPS DSM --------", Debug)
            If (LNotEqual (Arg1, 0x0100))
            {
                Return (0x80000002)
            }

            While (One)
            {
                Store (ToInteger (Arg2), _T_0)
                If (LEqual (_T_0, Zero))
                {
                    Name (FMSK, Buffer (0x08)
                    {
                        /* 0000 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
                    })
                    Store (Buffer (0x08)
                        {
                            /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        }, Local0)
                    Divide (Zero, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                        ))
                    Divide (0x13, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                        ))
                    Divide (0x20, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                        ))
                    Divide (0x21, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                        ))
                    Divide (0x22, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                        ))
                    Divide (0x23, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                        ))
                    Divide (0x2A, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                        ))
                    Store (SizeOf (Local0), Local1)
                    While (LNotEqual (Local1, Zero))
                    {
                        Decrement (Local1)
                        Store (DerefOf (Index (FMSK, Local1)), Local2)
                        And (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1
                            ))
                    }

                    Return (Local0)
                }
                Else
                {
                    If (LEqual (_T_0, 0x13))
                    {
                        Store ("GPS fun 19", Debug)
                        Return (Arg3)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x20))
                        {
                            Store ("GPS fun 20", Debug)
                            Name (RET1, Zero)
                            CreateBitField (Arg3, 0x18, NRIT)
                            CreateBitField (Arg3, 0x19, NRIS)
                            If (NRIS)
                            {
                                If (NRIT)
                                {
                                    Or (RET1, 0x01000000, RET1)
                                }
                                Else
                                {
                                    And (RET1, 0xFEFFFFFF, RET1)
                                }
                            }

                            Or (RET1, 0x40000000, RET1)
                            If (NLIM)
                            {
                                Or (RET1, One, RET1)
                            }

                            Return (RET1)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x21))
                            {
                                Return (\_PR.CPU0._PSS)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x22))
                                {
                                    CreateByteField (Arg3, Zero, PCAP)
                                    If (And (GPSC, One))
                                    {
                                        If (LOr (LEqual (\_SB.AC.ACFG, Zero), LEqual (And (OEMF, 0x02), 
                                            One)))
                                        {
                                            Store (\_PR.CPU0._PSS, Local1)
                                            Store (SizeOf (Local1), Local2)
                                            ShiftRight (Local2, One, Local0)
                                            Increment (Local0)
                                            If (LLess (PCAP, Local0))
                                            {
                                                Store (Local0, \_PR.CPU0._PPC)
                                                Store (Local0, PCAP)
                                            }
                                        }
                                    }

                                    Store (PCAP, \_PR.CPU0._PPC)
                                    PNOT ()
                                    If (And (GPSC, One))
                                    {
                                        Notify (\_SB.AC.ADJP, Zero)
                                    }

                                    Store (PCAP, PSAP)
                                    Return (PCAP)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x23))
                                    {
                                        Return (PSAP)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x25))
                                        {
                                            Store ("GPS fun 25", Debug)
                                            Return (\_PR.CPU0._TSS)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x26))
                                            {
                                                Store ("GPS fun 26", Debug)
                                                CreateDWordField (Arg3, Zero, TCAP)
                                                Store (TCAP, \_PR.CPU0._PTC)
                                                Notify (\_PR.CPU0, 0x80)
                                                Return (TCAP)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x2A))
                                                {
                                                    Store ("GPS fun 2a", Debug)
                                                    CreateByteField (Arg3, Zero, PSH0)
                                                    CreateByteField (Arg3, One, PSH1)
                                                    CreateBitField (Arg3, 0x08, GPUT)
                                                    CreateBitField (Arg3, 0x09, CPUT)
                                                    CreateBitField (Arg3, 0x0A, FANS)
                                                    CreateBitField (Arg3, 0x0B, SKIN)
                                                    CreateBitField (Arg3, 0x0C, ENGR)
                                                    CreateBitField (Arg3, 0x0D, SEN1)
                                                    CreateBitField (Arg3, 0x0E, SEN2)
                                                    While (One)
                                                    {
                                                        Store (PSH0, _T_1)
                                                        If (LEqual (_T_1, Zero))
                                                        {
                                                            If (CPUT)
                                                            {
                                                                Store (0x0200, RETN)
                                                                Or (RETN, PSH0, RETN)
                                                                Store (\_SB.PCI0.LPCB.EC.GTVR, PDTS)
                                                            }

                                                            Return (GPSP)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_1, One))
                                                            {
                                                                Store (0x0300, RETN)
                                                                Or (RETN, PSH0, RETN)
                                                                Store (0x03E8, PDTS)
                                                                Return (GPSP)
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_1, 0x02))
                                                                {
                                                                    Store (0x0102, RETN)
                                                                    Store (Zero, VRV1)
                                                                    If (N16F)
                                                                    {
                                                                        Store (Zero, TGPU)
                                                                        Store (One, \_SB.PCI0.LPCB.EC.N16C)
                                                                    }
                                                                    Else
                                                                    {
                                                                        Store (0x5C, TGPU)
                                                                        Store (Zero, \_SB.PCI0.LPCB.EC.N16C)
                                                                    }

                                                                    Store (Zero, PDTS)
                                                                    Store (Zero, SFAN)
                                                                    Store (Zero, CPUE)
                                                                    Store (Zero, SKNT)
                                                                    Store (Zero, TMP1)
                                                                    Store (Zero, TMP2)
                                                                    Return (GPSP)
                                                                }
                                                            }
                                                        }

                                                        Break
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Break
            }

            Return (0x80000002)
        }
    }

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        OperationRegion (MSID, SystemMemory, EBAS, 0x50)
        Field (MSID, DWordAcc, Lock, Preserve)
        {
            VEID,   16, 
            VDID,   16, 
                    Offset (0x40), 
            NVID,   32, 
                    Offset (0x4C), 
            ATID,   32
        }
    }

    Scope (\_SB.PCI0.PEG0)
    {
        OperationRegion (MSHB, SystemMemory, 0xF8008000, 0x90)
        Field (MSHB, DWordAcc, Lock, Preserve)
        {
                    Offset (0x04), 
            CMDR,   8, 
                    Offset (0x84), 
            D0ST,   2
        }

        Name (VEIB, Buffer (0x04)
        {
            0x00
        })
        Name (MSD3, Zero)
        PowerResource (NVP3, 0x00, 0x0000)
        {
            Name (_STA, One)
            Method (_ON, 0, NotSerialized)
            {
                If (LEqual (MSD3, 0x03))
                {
                    Store (0x7C, P80H)
                    Store (One, _STA)
                    Store (One, \_SB.PCI0.LPCB.EC.FDAT)
                    Store (0xBF, \_SB.PCI0.LPCB.EC.FCMD)
                    Sleep (0x14)
                    While (LEqual (\_SB.PCI0.LPCB.EC.DGPU, Zero))
                    {
                        Sleep (0x0A)
                    }

                    Store (Zero, \_SB.PCI0.PEG0.LNKD)
                    Store (Zero, Local7)
                    While (And (LLess (\_SB.PCI0.PEG0.LNKS, 0x07), LLess (Local7, 0x03E8)))
                    {
                        Increment (Local7)
                        Store (0x20, Local0)
                        While (Local0)
                        {
                            If (LLess (\_SB.PCI0.PEG0.LNKS, 0x07))
                            {
                                Sleep (0x64)
                                Decrement (Local0)
                            }
                            Else
                            {
                                Break
                            }
                        }

                        If (LEqual (Local0, Zero))
                        {
                            Store (One, \_SB.PCI0.PEG0.RTLK)
                            Sleep (0x64)
                        }

                        Sleep (One)
                    }

                    Store (\_SB.PCI0.PEG0.CMDR, Local0)
                    Store (Or (Local0, 0x03), Local0)
                    Store (Local0, \_SB.PCI0.PEG0.CMDR)
                    Store (Zero, \_SB.PCI0.PEG0.D0ST)
                    Sleep (0x64)
                    If (LEqual (\_SB.PCI0.PEG0.PEGP.VEID, 0x10DE))
                    {
                        Store (HYSS, \_SB.PCI0.PEG0.PEGP.NVID)
                    }

                    If (LEqual (\_SB.PCI0.PEG0.PEGP.VEID, 0x1002))
                    {
                        Store (HYSS, \_SB.PCI0.PEG0.PEGP.ATID)
                    }

                    If (\_SB.PCI0.PEG0.PEGP.OPTF)
                    {
                        Store (Zero, \_SB.PCI0.PEG0.PEGP.NHDM)
                    }

                    Store (One, _STA)
                    Store (Zero, MSD3)
                    Store (0x7D, P80H)
                }
            }

            Method (_OFF, 0, NotSerialized)
            {
                If (LEqual (MSD3, Zero))
                {
                    Store (0x7E, P80H)
                    Store (Zero, \_SB.PCI0.LPCB.EC.FDAT)
                    Store (0xBF, \_SB.PCI0.LPCB.EC.FCMD)
                    Sleep (0x012C)
                    Store (Zero, _STA)
                    Store (0x03, MSD3)
                    Store (0x7F, P80H)
                }
            }
        }

        PowerResource (NVP2, 0x00, 0x0000)
        {
            Name (_STA, One)
            Method (_ON, 0, NotSerialized)
            {
                Store (One, _STA)
                Store ("NVP2-_On ", Debug)
            }

            Method (_OFF, 0, NotSerialized)
            {
                Store (One, _STA)
                Store ("NvP2-_Off ", Debug)
            }
        }

        Name (_PR0, Package (0x01)
        {
            NVP3
        })
        Name (_PR2, Package (0x01)
        {
            NVP2
        })
        Name (_PR3, Package (0x01)
        {
            NVP3
        })
        Method (_S0W, 0, NotSerialized)
        {
            If (And (\_SB.OSCO, 0x04))
            {
                Return (0x04)
            }
            Else
            {
                Return (0x03)
            }
        }
    }

    Scope (\_SB.PCI0)
    {
        Device (WMI1)
        {
            Name (_HID, "PNP0C14")
            Name (_UID, "OPT1")
            Name (_WDG, Buffer (0x14)
            {
                /* 0000 */    0x3C, 0x5C, 0xCB, 0xF6, 0xAE, 0x9C, 0xBD, 0x4E, 
                /* 0008 */    0xB5, 0x77, 0x93, 0x1E, 0xA3, 0x2A, 0x2C, 0xC0, 
                /* 0010 */    0x4D, 0x58, 0x01, 0x02
            })
            Method (WMMX, 3, NotSerialized)
            {
                CreateDWordField (Arg2, Zero, FUNC)
                If (LEqual (FUNC, 0x534F525F))
                {
                    If (LGreaterEqual (SizeOf (Arg2), 0x08))
                    {
                        CreateDWordField (Arg2, 0x04, ARGS)
                        CreateDWordField (Arg2, 0x08, XARG)
                        Return (\_SB.PCI0.PEG0.PEGP._ROM (ARGS, XARG))
                    }
                }

                If (LEqual (FUNC, 0x4D53445F))
                {
                    If (LGreaterEqual (SizeOf (Arg2), 0x1C))
                    {
                        CreateField (Arg2, Zero, 0x80, MUID)
                        CreateDWordField (Arg2, 0x10, REVI)
                        CreateDWordField (Arg2, 0x14, SFNC)
                        CreateField (Arg2, 0xE0, 0x20, XRG0)
                        If (CondRefOf (\_SB.PCI0.GFX0._DSM))
                        {
                            Return (\_SB.PCI0.GFX0._DSM)
                            MUID
                            REVI
                            SFNC
                            XRG0
                        }
                    }
                }

                Return (Zero)
            }
        }
    }
}

