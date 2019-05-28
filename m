Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 653522BF09
	for <lists.iommu@lfdr.de>; Tue, 28 May 2019 08:06:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E549C1B5E;
	Tue, 28 May 2019 06:06:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4FFE01B56
	for <iommu@lists.linux-foundation.org>;
	Tue, 28 May 2019 06:04:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D8F0CD0
	for <iommu@lists.linux-foundation.org>;
	Tue, 28 May 2019 06:04:52 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 2D98A68BFE; Tue, 28 May 2019 08:04:25 +0200 (CEST)
Date: Tue, 28 May 2019 08:04:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v3 0/2] Optimize dma_*_from_contiguous calls
Message-ID: <20190528060424.GA11521@lst.de>
References: <20190524040633.16854-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524040633.16854-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: tony@atomide.com, catalin.marinas@arm.com, will.deacon@arm.com,
	jcmvbkbc@gmail.com, hch@lst.de, sfr@canb.auug.org.au,
	dann.frazier@canonical.com, linux@armlinux.org.uk,
	treding@nvidia.com, linux-xtensa@linux-xtensa.org,
	keescook@chromium.org, akpm@linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, chris@zankel.net,
	wsa+renesas@sang-engineering.com, robin.murphy@arm.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	iamjoonsoo.kim@lge.com, dwmw2@infradead.org
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

Thanks,

applied to dma-mapping for-next.

Can you also send a conversion of drivers/iommu/dma-iommu.c to your
new helpers against this tree?

http://git.infradead.org/users/hch/dma-mapping.git/shortlog/refs/heads/for-next
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
