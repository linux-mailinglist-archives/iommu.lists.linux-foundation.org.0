Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFAC1A81B2
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 17:13:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A08608454F;
	Tue, 14 Apr 2020 15:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHDEHnISHd6K; Tue, 14 Apr 2020 15:13:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 45B6484713;
	Tue, 14 Apr 2020 15:13:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BB8DC0172;
	Tue, 14 Apr 2020 15:13:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13FFCC0172
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 15:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 00BB78632E
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 15:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2RtQwJIMHzwd for <iommu@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 15:13:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E543285AA0
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 15:13:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y24so14374941wma.4
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 08:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HmBLSR0xc1v+9c640X8yq/gCGBtmZiJRhg2yrai8Uso=;
 b=SVMvBDJfReSnxAcQSUV9pF6TBnDAOlzpc7uACTnh9e+RdCy1ABvs75pslOFPBXCv4t
 5wIbMBGWFmNFnKFqA8QTAdT8mXMfvMv+uMiEfmwmhABegCHMrlA6/JGJr4Tl78XzC1Zg
 y4FiPwmCB77f7b5DpHdfoLVoAcI1E13lGKnmp3p7r85EFw3h0jXIdO3HSWp15lvebsL4
 wZM7rmNMI2inHMFqCYY8xTl7ZjlI6kjzRv55Z9zDnSpcY/U0TNqhfWfy7S4Is/mxc/ae
 KE7tb1MBig25LYsYFJNv3zmfFwu0+Sfd3N+z4Cki0+JU3AehN8s46lRu4ZCee7p0T30N
 w1Vg==
X-Gm-Message-State: AGi0Pub7pj106MpdqDWtW6bu2GJcRTPQ0we8YewWd7V9aMX/xc/Gwhv2
 sE91LNd7z/+jfMFp4Q97tEM=
X-Google-Smtp-Source: APiQypKJS2zs752mK3EmkKLPxDY+LMikzE4AHuLMlZzMU6rlOFHrjCq5D1gZZCfYEUzJLxq6M+CEVA==
X-Received: by 2002:a7b:c190:: with SMTP id y16mr393464wmi.50.1586877227391;
 Tue, 14 Apr 2020 08:13:47 -0700 (PDT)
Received: from debian (44.142.6.51.dyn.plus.net. [51.6.142.44])
 by smtp.gmail.com with ESMTPSA id t67sm20386094wmg.40.2020.04.14.08.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 08:13:46 -0700 (PDT)
Date: Tue, 14 Apr 2020 16:13:44 +0100
From: Wei Liu <wei.liu@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 21/29] mm: remove the pgprot argument to __vmalloc
Message-ID: <20200414151344.zgt2pnq7cjq2bgv6@debian>
References: <20200414131348.444715-1-hch@lst.de>
 <20200414131348.444715-22-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414131348.444715-22-hch@lst.de>
User-Agent: NeoMutt/20180716
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 linux-mm@kvack.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, x86@kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Gao Xiang <xiang@kernel.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Daniel Vetter <daniel@ffwll.ch>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
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

On Tue, Apr 14, 2020 at 03:13:40PM +0200, Christoph Hellwig wrote:
> The pgprot argument to __vmalloc is always PROT_KERNEL now, so remove
> it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Michael Kelley <mikelley@microsoft.com> [hyperv]
> Acked-by: Gao Xiang <xiang@kernel.org> [erofs]
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/x86/hyperv/hv_init.c              |  3 +--
[...]
> 
> diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
> index 5a4b363ba67b..a3d689dfc745 100644
> --- a/arch/x86/hyperv/hv_init.c
> +++ b/arch/x86/hyperv/hv_init.c
> @@ -95,8 +95,7 @@ static int hv_cpu_init(unsigned int cpu)
>  	 * not be stopped in the case of CPU offlining and the VM will hang.
>  	 */
>  	if (!*hvp) {
> -		*hvp = __vmalloc(PAGE_SIZE, GFP_KERNEL | __GFP_ZERO,
> -				 PAGE_KERNEL);
> +		*hvp = __vmalloc(PAGE_SIZE, GFP_KERNEL | __GFP_ZERO);
>  	}

Acked-by: Wei Liu <wei.liu@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
