Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7273C476F73
	for <lists.iommu@lfdr.de>; Thu, 16 Dec 2021 12:05:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A06140B31;
	Thu, 16 Dec 2021 11:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WunZQGsgyT_h; Thu, 16 Dec 2021 11:05:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5846740B13;
	Thu, 16 Dec 2021 11:05:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 036D2C0039;
	Thu, 16 Dec 2021 11:05:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8F2AC0012
 for <iommu@lists.linux-foundation.org>; Thu, 16 Dec 2021 11:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 757FA83498
 for <iommu@lists.linux-foundation.org>; Thu, 16 Dec 2021 11:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJXNuTWtA8sj for <iommu@lists.linux-foundation.org>;
 Thu, 16 Dec 2021 11:05:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6BBC83434
 for <iommu@lists.linux-foundation.org>; Thu, 16 Dec 2021 11:05:05 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so17872722wmc.2
 for <iommu@lists.linux-foundation.org>; Thu, 16 Dec 2021 03:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ia0s2pfedLLV2rKQx/9pdjpwFu99hZ9OuUlgB2e9yo0=;
 b=C0akeUrfUOfr2/7BryHvjzfohJ9jUCvOEyoQTxywqv486b/mNe7Um+GifFsIUtJRnd
 Izr9qvKv9bXY3epj4ZYzaSnEZkVFOZrht8JRURY9ClF04gyXL/cJeUMiBy+pyCmYu0ew
 Rgy8yiCcIzakDOEOj5Zto2nWjDINOgRHeSM8/WOfhBuPjk7lWRufwcfS51tIljmNoua7
 B8W+5Y4RvHdf25xcVLdRnpuVJACB7PMQouualumhjGnPIfZZaT7bWzOMrSXakWGiL59j
 7NjttMdUTshlyWzZIC545x1F+DwTH+OqbuMWPcESY2O+zaL/xPQkrn6zaT+ld15UfuwK
 rq7A==
X-Gm-Message-State: AOAM533zTHvPBqKonQC4Omt20nMDnHFFh1ZsbAejS04S6nqSQLCVTHUn
 F8IVWtCPpdcDBDHTbpRv1wE=
X-Google-Smtp-Source: ABdhPJz9k2azLHdE9YVUF2mYlnC5nG4eLgboSYl5jYHIGX/6zclpudEz7h2L6IJ5hM2Wce25bH6xTw==
X-Received: by 2002:a05:600c:296:: with SMTP id
 22mr4493492wmk.11.1639652703518; 
 Thu, 16 Dec 2021 03:05:03 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w15sm4376365wrk.77.2021.12.16.03.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 03:05:02 -0800 (PST)
Date: Thu, 16 Dec 2021 11:05:01 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [PATCH V7 1/5] swiotlb: Add swiotlb bounce buffer remap function
 for HV IVM
Message-ID: <20211216110501.y2i7adl3ilkrodaq@liuwe-devbox-debian-v2>
References: <20211213071407.314309-1-ltykernel@gmail.com>
 <20211213071407.314309-2-ltykernel@gmail.com>
 <198e9243-abca-b23e-0e8e-8581a7329ede@intel.com>
 <3243ff22-f6c8-b7cd-26b7-6e917e274a7c@gmail.com>
 <c25ff1e8-4d1e-cf1c-a9f6-c189307f92fd@intel.com>
 <a1c8f26f-fbf2-29b6-e734-e6d6151c39f8@amd.com>
 <7afc23c3-22e7-9bbf-7770-c683bf84a7cc@intel.com>
 <fb2ff8b7-ab8c-7c4b-0850-222cd2cf7c4a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb2ff8b7-ab8c-7c4b-0850-222cd2cf7c4a@gmail.com>
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com,
 dave.hansen@linux.intel.com, Dave Hansen <dave.hansen@intel.com>,
 hpa@zytor.com, kys@microsoft.com, hch@lst.de, linux-arch@vger.kernel.org,
 michael.h.kelley@microsoft.com, wei.liu@kernel.org, sthemmin@microsoft.com,
 linux-scsi@vger.kernel.org, x86@kernel.org, decui@microsoft.com,
 hch@infradead.org, mingo@redhat.com, kuba@kernel.org, jejb@linux.ibm.com,
 parri.andrea@gmail.com, Tom Lendacky <thomas.lendacky@amd.com>,
 Tianyu.Lan@microsoft.com, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, bp@alien8.de, tglx@linutronix.de,
 martin.petersen@oracle.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 vkuznets@redhat.com, robin.murphy@arm.com, davem@davemloft.net
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

On Wed, Dec 15, 2021 at 01:00:38PM +0800, Tianyu Lan wrote:
> 
> 
> On 12/15/2021 6:40 AM, Dave Hansen wrote:
> > On 12/14/21 2:23 PM, Tom Lendacky wrote:
> > > > I don't really understand how this can be more general any *not* get
> > > > utilized by the existing SEV support.
> > > 
> > > The Virtual Top-of-Memory (VTOM) support is an SEV-SNP feature that is
> > > meant to be used with a (relatively) un-enlightened guest. The idea is
> > > that the C-bit in the guest page tables must be 0 for all accesses. It
> > > is only the physical address relative to VTOM that determines if the
> > > access is encrypted or not. So setting sme_me_mask will actually cause
> > > issues when running with this feature. Since all DMA for an SEV-SNP
> > > guest must still be to shared (unencrypted) memory, some enlightenment
> > > is needed. In this case, memory mapped above VTOM will provide that via
> > > the SWIOTLB update. For SEV-SNP guests running with VTOM, they are
> > > likely to also be running with the Reflect #VC feature, allowing a
> > > "paravisor" to handle any #VCs generated by the guest.
> > > 
> > > See sections 15.36.8 "Virtual Top-of-Memory" and 15.36.9 "Reflect #VC"
> > > in volume 2 of the AMD APM [1].
> > 
> > Thanks, Tom, that's pretty much what I was looking for.
> > 
> > The C-bit normally comes from the page tables.  But, the hardware also
> > provides an alternative way to effectively get C-bit behavior without
> > actually setting the bit in the page tables: Virtual Top-of-Memory
> > (VTOM).  Right?
> > 
> > It sounds like Hyper-V has chosen to use VTOM instead of requiring the
> > guest to do the C-bit in its page tables.
> > 
> > But, the thing that confuses me is when you said: "it (VTOM) is meant to
> > be used with a (relatively) un-enlightened guest".  We don't have an
> > unenlightened guest here.  We have Linux, which is quite enlightened.
> > 
> > > Is VTOM being used because there's something that completely rules out
> > > using the C-bit in the page tables?  What's that "something"?
> 
> 
> For "un-enlightened" guest, there is an another system running insider
> the VM to emulate some functions(tsc, timer, interrupt and so on) and
> this helps not to modify OS(Linux/Windows) a lot. In Hyper-V Isolation
> VM, we called the new system as HCL/paravisor. HCL runs in the VMPL0 and
> Linux runs in VMPL2. This is similar with nested virtualization. HCL
> plays similar role as L1 hypervisor to emulate some general functions
> (e.g, rdmsr/wrmsr accessing and interrupt injection) which needs to be
> enlightened in the enlightened guest. Linux kernel needs to handle
> #vc/#ve exception directly in the enlightened guest. HCL handles such
> exception in un-enlightened guest and emulate interrupt injection which
> helps not to modify OS core part code. Using vTOM also is same purpose.
> Hyper-V uses vTOM avoid changing page table related code in OS(include
> Windows and Linux)and just needs to map memory into decrypted address
> space above vTOM in the driver code.
> 
> Linux has generic swiotlb bounce buffer implementation and so introduce
> swiotlb_unencrypted_base here to set shared memory boundary or vTOM.
> Hyper-V Isolation VM is un-enlightened guest. Hyper-V doesn't expose sev/sme
> capability to guest and so SEV code actually doesn't work.
> So we also can't interact current existing SEV code and these code is
> for enlightened guest support without HCL/paravisor. If other platforms
> or SEV want to use similar vTOM feature, swiotlb_unencrypted_base can
> be reused. So swiotlb_unencrypted_base is a general solution for all
> platforms besides SEV and Hyper-V.
> 

Thanks for the detailed explanation.

Dave, are you happy with this?

The code looks pretty solid to my untrained eyes. And the series has
collected necessary acks from stakeholders. If I don't hear objection by
EOD Friday I will apply this series to hyperv-next.

Wei.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
