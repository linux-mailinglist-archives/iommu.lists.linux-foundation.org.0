Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9DCDC0BD
	for <lists.iommu@lfdr.de>; Fri, 18 Oct 2019 11:20:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 813D01520;
	Fri, 18 Oct 2019 09:20:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9697E150C
	for <iommu@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 09:20:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 192ED608
	for <iommu@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571390408;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=lqNjg+EaGLj4NJ+f3f6IUdn2NqQIeIPYBk4IKGTbgOg=;
	b=Q1NP7SGyR1sbWkylxfi85Oi2FoF1lzPkI6CVEcPB5y7OsAbIBXKV6I41GBMRZWfDEIb4qR
	rHVkigjAIwPxkOXI/imzRZwewE1fa4iPttU64uOBuCdlBwbObKGT9FQuo208MwtSvwRRy1
	Kzq4K6O3YW+GT12kMvBPMDqAUXGdfNs=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
	[209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-286-jZwGXpk4PhGrPvUQ3kyD9Q-1; Fri, 18 Oct 2019 05:20:05 -0400
Received: by mail-io1-f70.google.com with SMTP id r20so7748651ioh.7
	for <iommu@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 02:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=RHTr/G3jxXej8cUMFfKi+HcWzJkXtd79itVbm58x3Nc=;
	b=DR2bXu4jph5prUBzEiM7QGdvqxUGCbtTBtG3mJD+wlKrBeSvaEoS5vyEth9O+IoI39
	KaNwU1tjJZXT7Odmank2faco65fn8gldmcnS9lX+IMFLM/z3V/239jxxk1RZ0WaDK3am
	r8hp/q2CgrHLNW2cQEebWQdoUVAVyOQdxw7tC7X2RfdJZa6Oihi87tjTZJGv420DDkAm
	Vbr/+NfDMzM8bd+xDilmeDSdZqWXvemAhXrFNX7N2uzWms0EDYXihPymoMz2m4RNMSCO
	fTWFNC/VUcZNRkSmIvCL0TVYCDoYpfLrC72zRYFo2uKX9FMJSmaxPZTtfuQYXWbdLXNA
	ACZQ==
X-Gm-Message-State: APjAAAXHJRC5Q4hVbWyC223Eft1phYbPL4FJu9R0I6iYX1wXyhIX0t/5
	xTMrtIAuAdyThIhrBWjI0GHtjDD77a6lY9SuQKS8MJABnjSQD1ZGXx1AnG2Jz7tPri0hOC6Mx8k
	kCLmWlzlAg3wErzP7m1wVRghiwp/Q+A==
X-Received: by 2002:a05:6638:3a6:: with SMTP id
	z6mr8060188jap.33.1571390404917; 
	Fri, 18 Oct 2019 02:20:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyeKV0GqHl8jqRB2FJYh+++6hNUR6kyjWJgdRjbQacCDJrFh4dUI6qLBvlkxQiaCvoFXgmjew==
X-Received: by 2002:a05:6638:3a6:: with SMTP id
	z6mr8060170jap.33.1571390404644; 
	Fri, 18 Oct 2019 02:20:04 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
	by smtp.gmail.com with ESMTPSA id n26sm2180447ili.8.2019.10.18.02.20.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 18 Oct 2019 02:20:03 -0700 (PDT)
Date: Fri, 18 Oct 2019 02:20:02 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] iommu/amd: Pass gfp flags to iommu_map_page() in
	amd_iommu_map()
Message-ID: <20191018092002.wmgjhfit56ezkyu6@cantor>
Mail-Followup-To: Joerg Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
References: <20191018090736.18819-1-joro@8bytes.org>
MIME-Version: 1.0
In-Reply-To: <20191018090736.18819-1-joro@8bytes.org>
User-Agent: NeoMutt/20180716
X-MC-Unique: jZwGXpk4PhGrPvUQ3kyD9Q-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Fri Oct 18 19, Joerg Roedel wrote:
>From: Joerg Roedel <jroedel@suse.de>
>
>A recent commit added a gfp parameter to amd_iommu_map() to make it
>callable from atomic context, but forgot to pass it down to
>iommu_map_page() and left GFP_KERNEL there. This caused
>sleep-while-atomic warnings and needs to be fixed.
>
>Reported-by: Qian Cai <cai@lca.pw>
>Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>Fixes: 781ca2de89ba ("iommu: Add gfp parameter to iommu_ops::map")
>Signed-off-by: Joerg Roedel <jroedel@suse.de>
>---
> drivers/iommu/amd_iommu.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
>index 0d2479546b77..fb54df5c2e11 100644
>--- a/drivers/iommu/amd_iommu.c
>+++ b/drivers/iommu/amd_iommu.c
>@@ -2561,7 +2561,7 @@ static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova,
> 	if (iommu_prot & IOMMU_WRITE)
> 		prot |= IOMMU_PROT_IW;
>
>-	ret = iommu_map_page(domain, iova, paddr, page_size, prot, GFP_KERNEL);
>+	ret = iommu_map_page(domain, iova, paddr, page_size, prot, gfp);
>
> 	domain_flush_np_cache(domain, iova, page_size);
>
>-- 
>2.16.4
>
>_______________________________________________
>iommu mailing list
>iommu@lists.linux-foundation.org
>https://lists.linuxfoundation.org/mailman/listinfo/iommu

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
