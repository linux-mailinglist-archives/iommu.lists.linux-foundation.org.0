Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0A3DB039
	for <lists.iommu@lfdr.de>; Thu, 17 Oct 2019 16:39:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5BCCEE6E;
	Thu, 17 Oct 2019 14:39:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DDE12C87
	for <iommu@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 14:39:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C1FD4608
	for <iommu@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 14:39:17 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id n7so3905531qtb.6
	for <iommu@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 07:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iPv4xGfmhNBcAudJ2m+U/PKGMmIbhs2/YkiMhF6fFPc=;
	b=Z5ozsxrLAow7bEU7nWG80R2CgeNG8zQPVzUL28MShaR4HDycfhOGCi8NaffDyAPvgD
	AIybmU8gw9TlH06J5Nu25r9iEAEFg/z7wjCu9bDYmbUcoBXw+plOlzkljXN+iUpVrvHe
	PGlPrqiGayV2ryqP8DJu8SMiX8/842fiXxbfVj52XoDzxXNqvWQJbkq3yn2W8ZI2jG4n
	DE2brcxf0FTMIcjPOygTmldJbycUwHlOhn1WI5Ac8dbJ3kAOm7ECVCqI30SsiNMJO0Te
	/3WwkxredcNT8VESSObYg2jVa3gZ2otkmLjZtpTOKAm9DNMPn9V8XlYjdpzOKpf8Rg1z
	x0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iPv4xGfmhNBcAudJ2m+U/PKGMmIbhs2/YkiMhF6fFPc=;
	b=Mp1WesuomqkY4xiQjTkMBFQu71kz5Fkksn9fJu5zF4pDZiDZtpxbL1JSiPceqAJJSI
	veFAFB0tFhI6QrA+gorgm2z6Rx4SGnzy9a8OrSD64v7O4iTTMCr4GRP28yxGZ02ahsvu
	5MxYUmetU3g3oqGwcUUi8SQbXI2rxfiH6pZs9huRQCTHmD+SzHtfyNpEx5WVcuaLogs9
	QTYAb6TjQlobLorVL+e6Tu57wcRR/mvByyczFg5MGnzWjE2qSXzwYEe4uTcNw2AcPOgU
	44Dy/c+GsvO8VHTTMSyGs4uZLs2pykfC54+/57diH46p+JoZBIiMmTLKL8N6gjuGVFwm
	OITw==
X-Gm-Message-State: APjAAAUj4HjuXyDAbKw/UoblwxxdpezOb24GTKyC//l2ZRKIn3yXovSa
	sBFJqMct4XVEy2JiILPkoD+BsQ==
X-Google-Smtp-Source: APXvYqy7YdxTEZrz6r7lhrlzaTDa41hLtMCzXF8omQ5PUo8wn41x4fS6Wd2cEiqylNBXkJ0ldg5xJA==
X-Received: by 2002:ac8:6144:: with SMTP id d4mr4164799qtm.282.1571323156758; 
	Thu, 17 Oct 2019 07:39:16 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
	[66.187.233.206]) by smtp.gmail.com with ESMTPSA id
	i66sm1135765qkb.105.2019.10.17.07.39.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Oct 2019 07:39:15 -0700 (PDT)
Message-ID: <1571323153.5937.67.camel@lca.pw>
Subject: Re: "Convert the AMD iommu driver to the dma-iommu api" is buggy
From: Qian Cai <cai@lca.pw>
To: Joerg Roedel <jroedel@suse.de>
Date: Thu, 17 Oct 2019 10:39:13 -0400
In-Reply-To: <20191016154455.GG4695@suse.de>
References: <1571237707.5937.58.camel@lca.pw>
	<1571237982.5937.60.camel@lca.pw> <20191016154455.GG4695@suse.de>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>, Tom Murphy <murphyt7@tcd.ie>,
	linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Wed, 2019-10-16 at 17:44 +0200, Joerg Roedel wrote:
> On Wed, Oct 16, 2019 at 10:59:42AM -0400, Qian Cai wrote:
> > BTW, the previous x86 warning was from only reverted one patch "iommu: Add gfp
> > parameter to iommu_ops::map" where proved to be insufficient. Now, pasting the
> > correct warning.
> 
> Can you please test this small fix:

This works fine so far.

> 
> diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
> index 78a2cca3ac5c..e7a4464e8594 100644
> --- a/drivers/iommu/amd_iommu.c
> +++ b/drivers/iommu/amd_iommu.c
> @@ -2562,7 +2562,7 @@ static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova,
>  	if (iommu_prot & IOMMU_WRITE)
>  		prot |= IOMMU_PROT_IW;
>  
> -	ret = iommu_map_page(domain, iova, paddr, page_size, prot, GFP_KERNEL);
> +	ret = iommu_map_page(domain, iova, paddr, page_size, prot, gfp);
>  
>  	domain_flush_np_cache(domain, iova, page_size);
>  
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
