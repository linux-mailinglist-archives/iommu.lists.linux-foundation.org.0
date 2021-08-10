Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E69263E58AE
	for <lists.iommu@lfdr.de>; Tue, 10 Aug 2021 12:56:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AE0E82CAC;
	Tue, 10 Aug 2021 10:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QSneOIda04HP; Tue, 10 Aug 2021 10:56:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B29D0831E7;
	Tue, 10 Aug 2021 10:56:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84D4EC000E;
	Tue, 10 Aug 2021 10:56:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D33E3C000E
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 10:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF1084045F
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 10:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Odyq1W1MTz2g for <iommu@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 10:56:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28CC64044D
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 10:56:13 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so2213364wmd.3
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 03:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M8c678fNnsGLoOeW7UexhiEvWyA8c3/gcsG+wSE2ct8=;
 b=hV4JzhrGRaZVdELgkvpS3JFp3pYeTg7odpgraBi9VmA/8Jdkvk6ZeS1tqTsVaCp0fq
 oRrtboNV3hmXdK2lG0+xuENrydO2c/SoZ6HQRoCKSMQHlRuUuFw7yGEp9a1b1gHU/04f
 kG7ECvjRWI67LXc5zxcoQEASFy/KapkL4cwYGg+kZzFbC9fdb27DZ9lfr7T4Una1uSBr
 qWKnlyHNHXRRTO1QEh8TeALFBMfhCStohpgbDUN7/5M0gjKSBLY/ftReeWVST8tO3x8e
 kw3xZVOS/r+WjoE2pXTaqBL8sr6F6E4+BExqeC3ALh3zvlQNuUJBWGL2HOQ1AsyGLL9W
 d8Uw==
X-Gm-Message-State: AOAM532aKST/nEuGhaSoAWCtfsYcyUdvmQcgszojdXgN1t2a81uvngj5
 F/9Fwi6oB77nyowg2cIrgp8=
X-Google-Smtp-Source: ABdhPJz2yF8WcgnnZUSV/YZcts24nqVnzunX66Xx60m+tHd6RHQnGzum63lk7AYwHZ32aACM7/ys3w==
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr2862006wmc.23.1628592971259; 
 Tue, 10 Aug 2021 03:56:11 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id x18sm20028730wmc.17.2021.08.10.03.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:56:10 -0700 (PDT)
Date: Tue, 10 Aug 2021 10:56:09 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [PATCH V3 01/13] x86/HV: Initialize GHCB page in Isolation VM
Message-ID: <20210810105609.soi67eg2us5w7yuq@liuwe-devbox-debian-v2>
References: <20210809175620.720923-1-ltykernel@gmail.com>
 <20210809175620.720923-2-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210809175620.720923-2-ltykernel@gmail.com>
Cc: parri.andrea@gmail.com, linux-hyperv@vger.kernel.org, brijesh.singh@amd.com,
 peterz@infradead.org, dave.hansen@linux.intel.com, vkuznets@redhat.com,
 hpa@zytor.com, kys@microsoft.com, will@kernel.org, boris.ostrovsky@oracle.com,
 linux-arch@vger.kernel.org, sfr@canb.auug.org.au, wei.liu@kernel.org,
 sstabellini@kernel.org, sthemmin@microsoft.com, xen-devel@lists.xenproject.org,
 linux-scsi@vger.kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org,
 decui@microsoft.com, hch@lst.de, michael.h.kelley@microsoft.com,
 mingo@redhat.com, pgonda@google.com, rientjes@google.com, kuba@kernel.org,
 jejb@linux.ibm.com, martin.b.radev@gmail.com, thomas.lendacky@amd.com,
 Tianyu.Lan@microsoft.com, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, bp@alien8.de, luto@kernel.org,
 krish.sadhukhan@oracle.com, tglx@linutronix.de, akpm@linux-foundation.org,
 jgross@suse.com, martin.petersen@oracle.com, saravanand@fb.com,
 netdev@vger.kernel.org, dave.hansen@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, rppt@kernel.org, hannes@cmpxchg.org,
 tj@kernel.org, ardb@kernel.org, robin.murphy@arm.com, davem@davemloft.net,
 kirill.shutemov@linux.intel.com
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

On Mon, Aug 09, 2021 at 01:56:05PM -0400, Tianyu Lan wrote:
[...]
>  static int hv_cpu_init(unsigned int cpu)
>  {
>  	union hv_vp_assist_msr_contents msr = { 0 };
> @@ -85,6 +111,8 @@ static int hv_cpu_init(unsigned int cpu)
>  		}
>  	}
>  
> +	hyperv_init_ghcb();
> +

Why is the return value not checked here? If that's not required, can
you leave a comment?

Wei.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
