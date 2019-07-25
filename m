Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1100775B4B
	for <lists.iommu@lfdr.de>; Fri, 26 Jul 2019 01:39:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7A48ACB0;
	Thu, 25 Jul 2019 23:39:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A3845C51
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 23:39:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 67F0B224
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 23:39:18 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u14so23538991pfn.2
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 16:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HL3f1QKfq6e08jFTkT6R2/ZO1CAKghKslwWUsBfzlRE=;
	b=fxsTZb5+9JjG5L78sk/u6L1+2uCXJaQQndxS0n8FFFMYFQlGUpOvCDNt6WowVMszs+
	9Rsl+Txt4aPJPnLpB2Zzhyd7mKGBE8AxCUFnlo/ahAFDH9aDASN3JRwUNm4TQrYmMPd8
	kG1T+/drikeEIkkLiM5R3z+/reVUS50ZPPG2klTvYg8dvOFTRqxg4oeUXm1icEL8wqgQ
	2zCaMYFycC2/+0CyoSp50LAo24XS6VpktBsnBS2BGuyNhwDsjAayBWFG5qSl54OFgte0
	mZa/twt+3yvDxUdy91GQc/as394cvZsJM4HM0JZD4sw4m5qWbKJr2KNKqitkb8rCrT0s
	b6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HL3f1QKfq6e08jFTkT6R2/ZO1CAKghKslwWUsBfzlRE=;
	b=AzfPxKrE7up2LAxLCT4IX2angDmM8KDK4H/yR6cqOBWH6JLsPhmR4vfsd4OibWmyMK
	cN1PaCMYOswVtEcSdHnqf1uJ+JSsT6mFMdNgjHZGjsDDY7pnXySIWZbM66DFfl5cRHun
	wrcBkab3yIGZVrT6iRJLpvjR09TD/lNv75KUorTYeerdehwKTXnaAtSQnOYzJV8Ag+tj
	SVwfNtYjHMs2F/kCJUkCJFc4NwYRq2CzGZe1mfCGbIV63oqIL4VwgthWTaapf0gqjuhK
	/qEczuTJHi37UcJ6QcDDfxS/C7A3PKJ/AMdNPorpZU9LAJO6IXr8QLZslQ9mGQvelhpl
	itwQ==
X-Gm-Message-State: APjAAAVFBD3HtjTEiaafatNR0Y0Ekp77kiDRsVdUMuFVFhI3MEpsNIVK
	KmnMvaNEBk28rTpw1880DWk=
X-Google-Smtp-Source: APXvYqySg1O90lACAxj6zg8wg9D5yLpJeufx39qsSItUWsy1Uh2PwD3ZJMfh6e3dZqmI2hDs1eQYKw==
X-Received: by 2002:a63:490a:: with SMTP id w10mr87122603pga.6.1564097957836; 
	Thu, 25 Jul 2019 16:39:17 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
	[216.228.112.22]) by smtp.gmail.com with ESMTPSA id
	f72sm70888203pjg.10.2019.07.25.16.39.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 25 Jul 2019 16:39:17 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: dafna.hirschfeld@collabora.com, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH 0/2] dma-contiguous: two bug fixes for dma_{alloc,
	free}_contiguous()
Date: Thu, 25 Jul 2019 16:39:57 -0700
Message-Id: <20190725233959.15129-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

There are two obvious bugs in these two functions. So having
two patches to fix them.

Nicolin Chen (2):
  dma-contiguous: do not overwrite align in dma_alloc_contiguous()
  dma-contiguous: page-align the size in dma_free_contiguous()

 kernel/dma/contiguous.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
