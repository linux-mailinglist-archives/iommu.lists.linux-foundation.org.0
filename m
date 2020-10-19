Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 09290292C80
	for <lists.iommu@lfdr.de>; Mon, 19 Oct 2020 19:18:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AF75086B22;
	Mon, 19 Oct 2020 17:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mur_-m0hqEoO; Mon, 19 Oct 2020 17:18:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 48C3486DAF;
	Mon, 19 Oct 2020 17:18:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3017CC0051;
	Mon, 19 Oct 2020 17:18:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE50FC0051
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 17:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D21FC86C95
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 17:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r40ObMqZSNdc for <iommu@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 17:18:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 77BF086B22
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 17:18:26 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id 67so518499iob.8
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 10:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wFuBir/YvHjP7d2gN79CK1W0plZCBLGLO37M7axrAJc=;
 b=tom0/k4WXXuhLo9fMXkhcwJVWFLlbOfwy2ZDKO4pDqlJVTyW1mnvMTOMF7xBkhJLMH
 XA2ExSpeqrzTa6TrxCwNy0PFe+VjVkthpJM8r1Jcj45808b/ux+rxZuU+vbQ2jXPw46X
 vLdtSYXw2+SeECTEfH9cr0Urx/hryhDXIxCCM6mf/4tSz/VgtKqOcdcG911xC2RjCN/A
 R7ojbOrOpkfNDDNAvcXwlEpwai2K1pXxuuRXN+IyQUij71ZGr6xsDQVoYqBh1eg8xSwC
 5oFly5kXdA3kocrOdFTUms29scmU0N8OcGup+zr3+iQox9+N9Ha+t5cI9LNmvtfFaOtz
 eg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=wFuBir/YvHjP7d2gN79CK1W0plZCBLGLO37M7axrAJc=;
 b=ZtJmvc++adFj1rAx9yH0pmgZHDPUvSPIBPTEJult5B9s3fbrKftSFeZgUWlEBpqJYA
 7/Bp3BeMXRhLYOtbUXT8UYnUcPRtiqqyhPFVGuiM7fiIColoMf6xda5JM7sk06pNjKPc
 fYZVKaZC5WCD5iHLOrsolGyx7BXhmxmHGEV+uNtnEzcxVoub9SOev0vNcq15phyzNR5X
 c3WRtAnDosHqYQ0Ti5BLkfPExfZ0x8mxdDETrGSX5M/YLm/zpDiXEepP7xQoR1O+LAE8
 yBkPekUVuBhYrCmvk6FnPzFhnHeKENJBb994QoDVprAlxFI3m9mIoA49rHq9k1wixiw0
 Ikmg==
X-Gm-Message-State: AOAM531lULf7eO8c7N2qfE11byG4gvX/Vz6ebs41hcx2UFEV/GCEsq3E
 ftYzsdI9ZNJue01bH8IHCpg=
X-Google-Smtp-Source: ABdhPJwGkQyTAlZd6nur7A0Kug/p2kDbfsOyLBxur0jlqp1BYwHJi529A04rqSuOEM5tnJ1DDP+BSA==
X-Received: by 2002:a6b:144e:: with SMTP id 75mr381758iou.39.1603127905681;
 Mon, 19 Oct 2020 10:18:25 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
 by smtp.gmail.com with ESMTPSA id v1sm396600ioe.0.2020.10.19.10.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 10:18:25 -0700 (PDT)
From: Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date: Mon, 19 Oct 2020 13:18:22 -0400
To: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH 07/13] x86: Secure Launch kernel early boot stub
Message-ID: <20201019171822.GD2701355@rani.riverdale.lan>
References: <1600959521-24158-1-git-send-email-ross.philipson@oracle.com>
 <1600959521-24158-8-git-send-email-ross.philipson@oracle.com>
 <20200924173801.GA103726@rani.riverdale.lan>
 <c9ab2edf-1aaf-a1c9-92d5-2d37382a3163@oracle.com>
 <20200925191842.GA643740@rani.riverdale.lan>
 <d34c189c-4528-0458-0b84-cfd36dc068b3@oracle.com>
 <20201015182654.lgtht5fd2aaunczu@tomti.i.net-space.pl>
 <20201016205151.GA1618249@rani.riverdale.lan>
 <20201019145153.7b6cg3rzj7g4njz6@tomti.i.net-space.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201019145153.7b6cg3rzj7g4njz6@tomti.i.net-space.pl>
Cc: linux-doc@vger.kernel.org, dpsmith@apertussolutions.com,
 Ross Philipson <ross.philipson@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 luto@amacapital.net, Arvind Sankar <nivedita@alum.mit.edu>, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, linux-integrity@vger.kernel.org,
 trenchboot-devel@googlegroups.com, tglx@linutronix.de
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

On Mon, Oct 19, 2020 at 04:51:53PM +0200, Daniel Kiper wrote:
> On Fri, Oct 16, 2020 at 04:51:51PM -0400, Arvind Sankar wrote:
> > On Thu, Oct 15, 2020 at 08:26:54PM +0200, Daniel Kiper wrote:
> > >
> > > I am discussing with Ross the other option. We can create
> > > .rodata.mle_header section and put it at fixed offset as
> > > kernel_info is. So, we would have, e.g.:
> > >
> > > arch/x86/boot/compressed/vmlinux.lds.S:
> > >         .rodata.kernel_info KERNEL_INFO_OFFSET : {
> > >                 *(.rodata.kernel_info)
> > >         }
> > >         ASSERT(ABSOLUTE(kernel_info) == KERNEL_INFO_OFFSET, "kernel_info at bad address!")
> > >
> > >         .rodata.mle_header MLE_HEADER_OFFSET : {
> > >                 *(.rodata.mle_header)
> > >         }
> > >         ASSERT(ABSOLUTE(mle_header) == MLE_HEADER_OFFSET, "mle_header at bad address!")
> > >
> > > arch/x86/boot/compressed/sl_stub.S:
> > > #define mleh_rva(X) (((X) - mle_header) + MLE_HEADER_OFFSET)
> > >
> > >         .section ".rodata.mle_header", "a"
> > >
> > > SYM_DATA_START(mle_header)
> > >         .long   0x9082ac5a    /* UUID0 */
> > >         .long   0x74a7476f    /* UUID1 */
> > >         .long   0xa2555c0f    /* UUID2 */
> > >         .long   0x42b651cb    /* UUID3 */
> > >         .long   0x00000034    /* MLE header size */
> > >         .long   0x00020002    /* MLE version 2.2 */
> > >         .long   mleh_rva(sl_stub_entry)    /* Linear entry point of MLE (virt. address) */
> > >         .long   0x00000000    /* First valid page of MLE */
> > >         .long   0x00000000    /* Offset within binary of first byte of MLE */
> > >         .long   0x00000000    /* Offset within binary of last byte + 1 of MLE */
> > >         .long   0x00000223    /* Bit vector of MLE-supported capabilities */
> > >         .long   0x00000000    /* Starting linear address of command line (unused) */
> > >         .long   0x00000000    /* Ending linear address of command line (unused) */
> > > SYM_DATA_END(mle_header)
> > >
> > > Of course MLE_HEADER_OFFSET has to be defined as a constant somewhere.
> > > Anyway, is it acceptable?
> 
> What do you think about my MLE_HEADER_OFFSET and related stuff proposal?
> 

I'm wondering if it would be easier to just allow relocations in these
special "header" sections. I need to check how easy/hard it is to do
that without triggering linker warnings.

Thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
