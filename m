Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F428222624
	for <lists.iommu@lfdr.de>; Thu, 16 Jul 2020 16:48:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C63AE8B1D7;
	Thu, 16 Jul 2020 14:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FsyOOFtP1UjQ; Thu, 16 Jul 2020 14:48:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 065C68B1D9;
	Thu, 16 Jul 2020 14:48:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9550C0733;
	Thu, 16 Jul 2020 14:48:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 203F5C0733
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 14:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1B68B221B5
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 14:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X+WIFGG70JWZ for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 14:47:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id A8E072207F
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 14:47:58 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DE15068BFE; Thu, 16 Jul 2020 16:47:53 +0200 (CEST)
Date: Thu, 16 Jul 2020 16:47:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Yunfeng Ye <yeyunfeng@huawei.com>
Subject: Re: [PATCH] dma-coherent: switch to bitmap_zalloc() in
 dma_init_coherent_memory()
Message-ID: <20200716144753.GA24439@lst.de>
References: <1b02b07b-617e-bc5c-8619-7a46fba5a512@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b02b07b-617e-bc5c-8619-7a46fba5a512@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Hewenliang <hewenliang4@huawei.com>, Shiyuan Hu <hushiyuan@huawei.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 robin.murphy@arm.com, Christoph Hellwig <hch@lst.de>
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

Applied to nvme-5.9.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
