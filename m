Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3734B072D
	for <lists.iommu@lfdr.de>; Thu, 10 Feb 2022 08:30:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88D9881426;
	Thu, 10 Feb 2022 07:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6tkq_LQugRGA; Thu, 10 Feb 2022 07:30:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A3B218174C;
	Thu, 10 Feb 2022 07:30:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AED0C0073;
	Thu, 10 Feb 2022 07:30:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D2A2C000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Feb 2022 07:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E6918142D
 for <iommu@lists.linux-foundation.org>; Thu, 10 Feb 2022 07:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57Jb3VmgyE5z for <iommu@lists.linux-foundation.org>;
 Thu, 10 Feb 2022 07:30:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 858D681426
 for <iommu@lists.linux-foundation.org>; Thu, 10 Feb 2022 07:30:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C6A9E68BEB; Thu, 10 Feb 2022 08:30:02 +0100 (CET)
Date: Thu, 10 Feb 2022 08:30:01 +0100
From: Christoph Hellwig <hch@lst.de>
To: chenxiang <chenxiang66@hisilicon.com>
Subject: Re: [PATCH] MAINTAINERS: Update maintainer list of DMA MAPPING
 BENCHMARK
Message-ID: <20220210073001.GA5028@lst.de>
References: <1644303891-81063-1-git-send-email-chenxiang66@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1644303891-81063-1-git-send-email-chenxiang66@hisilicon.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linuxarm@huawei.com, linuxarm@openeuler.org,
 iommu@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 robin.murphy@arm.com, hch@lst.de
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

applied to the dma-mapping tree for 5.18.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
