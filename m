Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BC52490A8
	for <lists.iommu@lfdr.de>; Wed, 19 Aug 2020 00:18:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9EB7520552;
	Tue, 18 Aug 2020 22:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jjgiaz1QMDpr; Tue, 18 Aug 2020 22:18:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 444B620529;
	Tue, 18 Aug 2020 22:18:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B65FC0051;
	Tue, 18 Aug 2020 22:18:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 005BFC0051
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 22:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DA58985A84
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 22:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KCgvkxc-vswU for <iommu@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 22:18:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1334585118
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 22:18:14 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id j22so11048789lfm.2
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 15:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nn5mkrGFBbPg90QSTX4ScoaPazdulb+v6hO8tmlQUhM=;
 b=OIqydpEtkNgTroF3lnVBbcPUKQ2ogcmEFiN7wEqPDoyKdbDTrVZZ+NzClaB1tmtiGg
 1q5dVw3gvA1HPNIt4f5Vr2bR4NBZwxXhiEUf3tzRwKt7NekpaA3/ibZvmA16+OG3grZ+
 Y0pgD14ByceFmFxwkAMy97PtaHPZGmMkTHmHfX1qI8cguewQrhSEyNet//D8uLt3URbX
 wtAIYHJxjbyMRdcrkRjXE+IjNA6JaY3Jp4v8SILylCVLQ416pwm5RG8VS/kkCIf9Vupf
 N2rIlz5ZIsghwkVWwHdlgrBINrap6VQaSjRwMPYFZcqiCFlD1Cw4CyHiSO7wqpA8NX8m
 GJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nn5mkrGFBbPg90QSTX4ScoaPazdulb+v6hO8tmlQUhM=;
 b=cq0/SAaSvpAXedEh03FDz1Uq+tQI2XbVfNSY7bxNXYGlwrpl7Una0S4p58Hog24PqY
 MWFqKRgu03NZ3Lr76ftCWT+IVEfko9qUUeCtAoXGJ6hoGUiyENGIvnjQQPObk7eEmnFY
 zFd+Avt//8dlwMPOuHZ1GkCSc2AtddmNKmBapWT4XMcNoOhns9Et0q8QQHnJXua3f4SH
 64xWr4wkSqjpuPOX5VXZQg9wY4eg3XLzi+ymEpaqLc+i++l8lgOM4ZLziI0vbKtUnw+p
 aVCbS3DzUuaqQOPq3UBQYlcEtdQcMOxtrui4+PLPNcLR34XKIWdgum4M59MweZikA6a9
 Gukw==
X-Gm-Message-State: AOAM531LcDn60PicD/6Zj45oGI+6GIIahhK58oK4/axmXqUOXegdDkW9
 wALnxhnVApTS4J6He803TXFVRScl17U/QsZuRNA=
X-Google-Smtp-Source: ABdhPJyYNUN3v5scOCVMaoKuHu78eqvAibUFuUkJdpzA5rqp/I7KCAgyGHrlcUN+z5qLySo7/N7W852szcke7k/pYlA=
X-Received: by 2002:a19:cb51:: with SMTP id b78mr10676996lfg.130.1597789091106; 
 Tue, 18 Aug 2020 15:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200818151634.14343-1-rppt@kernel.org>
 <20200818151634.14343-11-rppt@kernel.org>
In-Reply-To: <20200818151634.14343-11-rppt@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Aug 2020 00:18:00 +0200
Message-ID: <CANiq72mnzTv7SphVxsYy++rAPdaKVVLGGHauxNLY5D4dzq3CPA@mail.gmail.com>
Subject: Re: [PATCH v3 10/17] memblock: reduce number of parameters in
 for_each_mem_range()
To: Mike Rapoport <rppt@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Michael Ellerman <mpe@ellerman.id.au>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Linux-MM <linux-mm@kvack.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Aug 18, 2020 at 5:19 PM Mike Rapoport <rppt@kernel.org> wrote:
>
>  .clang-format                          |  2 ++

For the .clang-format bit:

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
