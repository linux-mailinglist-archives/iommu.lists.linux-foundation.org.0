Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF8F16915E
	for <lists.iommu@lfdr.de>; Sat, 22 Feb 2020 20:02:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0C8B120423;
	Sat, 22 Feb 2020 19:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5QbTvVj+rR3X; Sat, 22 Feb 2020 19:02:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9A31720410;
	Sat, 22 Feb 2020 19:02:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D44AC013E;
	Sat, 22 Feb 2020 19:02:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EB71C013E
 for <iommu@lists.linux-foundation.org>; Sat, 22 Feb 2020 19:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 73F818624E
 for <iommu@lists.linux-foundation.org>; Sat, 22 Feb 2020 19:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Je5-j5swsr-K for <iommu@lists.linux-foundation.org>;
 Sat, 22 Feb 2020 19:02:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EB5EB863D5
 for <iommu@lists.linux-foundation.org>; Sat, 22 Feb 2020 19:02:30 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id u12so2753523pgb.10
 for <iommu@lists.linux-foundation.org>; Sat, 22 Feb 2020 11:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/g7Yzqg2i1uPH5SCb/FBgV+Inoxb7FBfivGxTzg0oBM=;
 b=sy1ga9RNOGqKGT4ykM8f/2mbuDouylzO5gTYi5m0Gc6Xr1zI3kqnlOC+lRCZijaQgA
 53O9n7flSOmOkrv4hROnoQveZCl8uuOosKVlPTbtRD6uY+2dmHumD+wsObqQr+hrwNjS
 57imgJ5XD4MvZjL/IDzwto3MtKlOISl29EbmGKcLRSmTMygEYquPZuIBzZyUUIjZ3LMg
 +DnGgtMJK8I/27W/RNSuVHRNqhlb+HLxSvjCiepGbuQF68IeZBCw66ePDrHxthGVc0Xk
 YICB9fxBi/FG794uW3qQ2voJyLXX7BgieivKF84Oa6IyblNfqqNDEIdnUVuhrS1YXDMv
 43vQ==
X-Gm-Message-State: APjAAAX+7Y0GfIB3Nq96WBCb/o+xR2pf9JbKsIKu0EArgjWw4rCA0t8F
 GEsigzssea4q/mCTBPm2cWI=
X-Google-Smtp-Source: APXvYqxMpSFQOjX83RM46otVFsQIWi9gjnENbEG13uvzVQl3HyqQPaSW/KXOjzMnbCgALH4gQR83+w==
X-Received: by 2002:a63:d003:: with SMTP id z3mr43261005pgf.448.1582398150324; 
 Sat, 22 Feb 2020 11:02:30 -0800 (PST)
Received: from localhost ([2601:647:5b00:710:ffa7:88dc:9c39:76d9])
 by smtp.gmail.com with ESMTPSA id a19sm6719276pju.11.2020.02.22.11.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 11:02:29 -0800 (PST)
Date: Sat, 22 Feb 2020 11:02:28 -0800
From: Moritz Fischer <mdf@kernel.org>
To: Yonghyun Hwang <yonghyun@google.com>
Subject: Re: [PATCH v2] iommu/vt-d: Fix a bug in intel_iommu_iova_to_phys()
 for huge page
Message-ID: <20200222190228.GA7728@epycbox.lan>
References: <20200220194431.169629-1-yonghyun@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220194431.169629-1-yonghyun@google.com>
Cc: linux-kernel@vger.kernel.org, Havard Skinnemoen <hskinnemoen@google.com>,
 iommu@lists.linux-foundation.org, Deepa Dinamani <deepadinamani@google.com>,
 Moritz Fischer <mdf@kernel.org>, David Woodhouse <dwmw2@infradead.org>
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

On Thu, Feb 20, 2020 at 11:44:31AM -0800, Yonghyun Hwang wrote:
> intel_iommu_iova_to_phys() has a bug when it translates an IOVA for a huge
> page onto its corresponding physical address. This commit fixes the bug by
> accomodating the level of page entry for the IOVA and adds IOVA's lower
> address to the physical address.
> 
> Signed-off-by: Yonghyun Hwang <yonghyun@google.com>
Reviewed-by: Moritz Fischer <mdf@kernel.org>
> ---
> 
> Changes from v1:
> - level cannot be 0. So, the condition, "if (level > 1)", is removed, which results in a simple code.
> - a macro, BIT_MASK, is used to have a bit mask
> 
> ---
>  drivers/iommu/intel-iommu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 932267f49f9a..4fd5c6287b6d 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -5554,7 +5554,9 @@ static phys_addr_t intel_iommu_iova_to_phys(struct iommu_domain *domain,
>  
>  	pte = pfn_to_dma_pte(dmar_domain, iova >> VTD_PAGE_SHIFT, &level);
>  	if (pte)
> -		phys = dma_pte_addr(pte);
> +		phys = dma_pte_addr(pte) +
> +			(iova & (BIT_MASK(level_to_offset_bits(level) +
> +						VTD_PAGE_SHIFT) - 1));
>  
>  	return phys;
>  }
> -- 
> 2.25.0.265.gbab2e86ba0-goog
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
