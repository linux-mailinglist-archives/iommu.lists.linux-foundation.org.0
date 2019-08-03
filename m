Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEBF804A7
	for <lists.iommu@lfdr.de>; Sat,  3 Aug 2019 08:26:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B67AB166E;
	Sat,  3 Aug 2019 06:26:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C292DDB3
	for <iommu@lists.linux-foundation.org>;
	Sat,  3 Aug 2019 06:23:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5E74B712
	for <iommu@lists.linux-foundation.org>;
	Sat,  3 Aug 2019 06:23:37 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0D4EA68C4E; Sat,  3 Aug 2019 08:23:33 +0200 (CEST)
Date: Sat, 3 Aug 2019 08:23:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: gavinli@thegavinli.com
Subject: Re: [PATCH v1] dma-mapping: normal memory for mmap() on coherent
	architectures
Message-ID: <20190803062333.GC29348@lst.de>
References: <20190802180758.9691-1-gavinli@thegavinli.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802180758.9691-1-gavinli@thegavinli.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Gavin Li <git@thegavinli.com>, iommu@lists.linux-foundation.org,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

See the discussion at:

https://lists.linuxfoundation.org/pipermail/iommu/2019-August/037716.html

Just curious, what driver do you use that uses dma_mmap_coherent on
x86?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
