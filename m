Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C48EB47472A
	for <lists.iommu@lfdr.de>; Tue, 14 Dec 2021 17:10:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6746E4056D;
	Tue, 14 Dec 2021 16:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_aJZBzgcMEW; Tue, 14 Dec 2021 16:10:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 642C140560;
	Tue, 14 Dec 2021 16:10:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3744BC0012;
	Tue, 14 Dec 2021 16:10:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97602C0012
 for <iommu@lists.linux-foundation.org>; Tue, 14 Dec 2021 16:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73AF06063B
 for <iommu@lists.linux-foundation.org>; Tue, 14 Dec 2021 16:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZulANIhOD_F for <iommu@lists.linux-foundation.org>;
 Tue, 14 Dec 2021 16:10:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8727460087
 for <iommu@lists.linux-foundation.org>; Tue, 14 Dec 2021 16:10:08 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id t9so33234143wrx.7
 for <iommu@lists.linux-foundation.org>; Tue, 14 Dec 2021 08:10:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZHPbCWI6bYGyjK8mmI0D3KyfsrOlvTBd5Vd+F5/Vwkw=;
 b=p+SD+TBBOzr3r5TAUeFcSpk4gsWlh3gmUt0lhC5XdVeixyA5sMIViixS/ktHGUMYJQ
 AeB+kMdJXkjZIRKgVZebvHTBOg5Nl7HOwaJ1pJQVwe2pbyv1CRQM8F2KEF/Ck+x82gCE
 VgKzBujP+3BBpqFgDbfH/geOPpG6KR0EpkW6p88jZSy1HraElCPTFbLexYRDlegPHJQ5
 1c0UusijvJSEJNu1ZPXfDswj57HNSbKs7S7lBv/2zRREtNXo9W4SPGGcYWp560/sjG8A
 1xJvn0m3g6jJVy0C+6kjPVhyskup4h9uYUnjVqs1jGS/tSiO1dKx4R4YH/G/QYOElnvr
 IJMg==
X-Gm-Message-State: AOAM533O6Ag0k7cF3t4/vjLjzMWzJbvCNHtZKgAHNuiT1m/7EEtc5k6H
 jU+MyC3ZEIM5ZG7dg2cjTp8=
X-Google-Smtp-Source: ABdhPJzA+fSss7tQ8CtjfcSBZIFl347bWFgxFbLG30HYf3L29Y8+Tw56U4i6sm2K19aVkEk2EE2ZJw==
X-Received: by 2002:a5d:6a8f:: with SMTP id s15mr6869384wru.544.1639498206781; 
 Tue, 14 Dec 2021 08:10:06 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u10sm363011wrs.99.2021.12.14.08.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:10:06 -0800 (PST)
Date: Tue, 14 Dec 2021 16:10:04 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH V7 2/5] x86/hyper-v: Add hyperv Isolation VM check in the
 cc_platform_has()
Message-ID: <20211214161004.6ofxl5ko43myn76o@liuwe-devbox-debian-v2>
References: <20211213071407.314309-1-ltykernel@gmail.com>
 <20211213071407.314309-3-ltykernel@gmail.com>
 <YbjArUL+biZMsFOL@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YbjArUL+biZMsFOL@zn.tnic>
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com,
 dave.hansen@linux.intel.com, dave.hansen@intel.com, hpa@zytor.com,
 kys@microsoft.com, hch@lst.de, linux-arch@vger.kernel.org, hch@infradead.org,
 wei.liu@kernel.org, sthemmin@microsoft.com, linux-scsi@vger.kernel.org,
 x86@kernel.org, decui@microsoft.com, Tianyu Lan <ltykernel@gmail.com>,
 michael.h.kelley@microsoft.com, mingo@redhat.com, kuba@kernel.org,
 jejb@linux.ibm.com, parri.andrea@gmail.com, thomas.lendacky@amd.com,
 Tianyu.Lan@microsoft.com, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, tglx@linutronix.de, martin.petersen@oracle.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, vkuznets@redhat.com, robin.murphy@arm.com,
 davem@davemloft.net
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

On Tue, Dec 14, 2021 at 05:05:01PM +0100, Borislav Petkov wrote:
> On Mon, Dec 13, 2021 at 02:14:03AM -0500, Tianyu Lan wrote:
> > From: Tianyu Lan <Tianyu.Lan@microsoft.com>
> > 
> > Hyper-V provides Isolation VM for confidential computing support and
> > guest memory is encrypted in it. Places checking cc_platform_has()
> > with GUEST_MEM_ENCRYPT attr should return "True" in Isolation vm. e.g,
> 
> Stick to a single spelling variant: "VM".
> 
> > swiotlb bounce buffer size needs to adjust according to memory size
> > in the sev_setup_arch().
> 
> So basically you wanna simply say here:
> 
> "Hyper-V Isolation VMs need to adjust the SWIOTLB size just like SEV
> guests. Add a hyperv_cc_platform_has() variant which enables that."
> 
> ?
> 
> With that addressed you can have my
> 
> Acked-by: Borislav Petkov <bp@suse.de>

Thanks. I can address your comments when I pick up this series.

Wei.

> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
