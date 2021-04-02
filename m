Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D85352B56
	for <lists.iommu@lfdr.de>; Fri,  2 Apr 2021 16:42:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DAE741561;
	Fri,  2 Apr 2021 14:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrCwMamNgLMD; Fri,  2 Apr 2021 14:42:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43C6E41822;
	Fri,  2 Apr 2021 14:42:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2194FC000A;
	Fri,  2 Apr 2021 14:42:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B498AC000A
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 14:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B17694025A
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 14:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FT7A-uC-L98n for <iommu@lists.linux-foundation.org>;
 Fri,  2 Apr 2021 14:42:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31ACB400AF
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 14:42:02 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 63D5768BEB; Fri,  2 Apr 2021 16:42:00 +0200 (CEST)
Date: Fri, 2 Apr 2021 16:42:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hao Fang <fanghao11@huawei.com>
Subject: Re: [PATCH] dma-mapping: benchmark: use the correct HiSilicon
 copyright
Message-ID: <20210402144200.GC19219@lst.de>
References: <1617086028-18986-1-git-send-email-fanghao11@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617086028-18986-1-git-send-email-fanghao11@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linuxarm@openeuler.org, iommu@lists.linux-foundation.org,
 linux-kselftest@vger.kernel.org, robin.murphy@arm.com, hch@lst.de
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

Thanks, applied.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
