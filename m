Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5D7428C4A
	for <lists.iommu@lfdr.de>; Mon, 11 Oct 2021 13:44:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A103A4028C;
	Mon, 11 Oct 2021 11:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bqp6tnqq9jaM; Mon, 11 Oct 2021 11:44:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5CA4B40383;
	Mon, 11 Oct 2021 11:44:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E6B7C0022;
	Mon, 11 Oct 2021 11:44:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E99CC000D
 for <iommu@lists.linux-foundation.org>; Mon, 11 Oct 2021 11:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E221740383
 for <iommu@lists.linux-foundation.org>; Mon, 11 Oct 2021 11:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhlFgckdou7t for <iommu@lists.linux-foundation.org>;
 Mon, 11 Oct 2021 11:44:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 639944028C
 for <iommu@lists.linux-foundation.org>; Mon, 11 Oct 2021 11:44:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 22C7B68B05; Mon, 11 Oct 2021 13:44:23 +0200 (CEST)
Date: Mon, 11 Oct 2021 13:44:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH] dma-mapping: fix the kerneldoc for dma_map_sgtable()
Message-ID: <20211011114422.GA16322@lst.de>
References: <20211005164812.15938-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211005164812.15938-1-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>, linux-doc@vger.kernel.org
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

Thanks,

applied.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
