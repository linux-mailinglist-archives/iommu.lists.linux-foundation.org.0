Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 15839300502
	for <lists.iommu@lfdr.de>; Fri, 22 Jan 2021 15:13:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CB16386D0C;
	Fri, 22 Jan 2021 14:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XhSUiRenqtRA; Fri, 22 Jan 2021 14:13:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4DBCB86D41;
	Fri, 22 Jan 2021 14:13:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E227C013A;
	Fri, 22 Jan 2021 14:13:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3FCBC013A
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 14:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 98F7D87327
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 14:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQb3GpeXjVzh for <iommu@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 14:13:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B953987309
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 14:13:45 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v15so5221889wrx.4
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 06:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=r3ROlS+99yPh3Cf8rVxZygPyogtMgfG8l3Bd6blxRns=;
 b=roCSatN8uErvDWYGEyV3aDuDpJJLYmYqOcbGcLYN2nRARag3Jz19mcjJiypn5PdgsQ
 7uJh0it0gRIAN1yoR+O0vgHuWzbRMeQi4mlHxdhVXzgvoNF42d6J/AHHpCJJLZ3dj7YT
 lpd0P4N9QC3h55YlRObPqwQqZdQtPJThLo7GLHWpx88W1IPUTvoWpzbyavIobtrCqMfR
 ykTzYYnInxW9842rnCkBmqd9KHNCwBXqyJI0N3OggcNIr3QZ34RL6zZ2q7T84/l4QwQ9
 +BfCh6hhp24avtoFN07lZktp3eBR4nvcC1CNpbw7XFP4mmPMpA0rzg2B0fNVpqI5x0hx
 9uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r3ROlS+99yPh3Cf8rVxZygPyogtMgfG8l3Bd6blxRns=;
 b=Gl3pmubCTvWKPOXPhbUgWe24qdRcTd1vzMLXhF6BoWZ8aNPlrqGJGBErYx7d8C2K2d
 6aT8rEVHrsym9aNZnyzJg+UKdknDxG/tTUqdfgrFrU7szIJKFLsmdioCZBbVzEwEYO0h
 ff4G6mVxM+M1GuuMlVT79TZw1zI+4JMurr76/KV3nFn1mIagTv2Fu6DEycCR7zJdXEqb
 gG2exefrMaQHllAdNdfvrVngM/fB3QiHn/97DU4EOTy8VoBgmJP3ebvMmIWeYCCDovAS
 IBasup6rmyE6JMHvVE/b+49MDKEHcJCw85/Yt+8luvjnouLdYD2Rq5+8auMxWSxcn+0l
 Rmqg==
X-Gm-Message-State: AOAM5315jAVLMP6FUEqEDSXEVv5VsRA5MkfplQS+5dlAAanpmyatH7fs
 MqK4p0ThlwdQYwDWwInNQ6dotA==
X-Google-Smtp-Source: ABdhPJzfvPjjb/O+AAsiAFD7Fq3vGIjrDRJkTjrUKWqwngjwrVGooW9LBrLl/l6negP8ADFJbj+pyw==
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr4803926wrp.121.1611324824306; 
 Fri, 22 Jan 2021 06:13:44 -0800 (PST)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id w4sm11330748wmc.13.2021.01.22.06.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 06:13:43 -0800 (PST)
Date: Fri, 22 Jan 2021 15:13:24 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/3] iommu/arm-smmu-v3: Make BTM optional for SVA
Message-ID: <YArdhKeLJ0w6nHCS@myrica>
References: <20210122115257.2502526-1-jean-philippe@linaro.org>
 <20210122115257.2502526-3-jean-philippe@linaro.org>
 <14f78aee-c7fd-22ff-64d4-6aff2e9ec015@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14f78aee-c7fd-22ff-64d4-6aff2e9ec015@arm.com>
Cc: vivek.gautam@arm.com, iommu@lists.linux-foundation.org,
 zhangfei.gao@linaro.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
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

On Fri, Jan 22, 2021 at 02:04:55PM +0000, Robin Murphy wrote:
> > @@ -182,9 +183,13 @@ static void arm_smmu_mm_invalidate_range(struct mmu_notifier *mn,
> >   					 unsigned long start, unsigned long end)
> >   {
> >   	struct arm_smmu_mmu_notifier *smmu_mn = mn_to_smmu(mn);
> > +	struct arm_smmu_domain *smmu_domain = smmu_mn->domain;
> > +	size_t size = end - start + 1;
> > -	arm_smmu_atc_inv_domain(smmu_mn->domain, mm->pasid, start,
> > -				end - start + 1);
> > +	if (smmu_mn->tlb_inv_command)
> 
> Since we're going to be drilling down to smmu_domain->smmu->features in the
> invalidate call anyway, perhaps we could just test for BTM directly here?

Yes even with BTM enabled we'll still check features in atc_inv_domain(),
so this shortcut isn't useful.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
