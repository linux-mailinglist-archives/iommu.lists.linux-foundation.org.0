Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DA43F06B0
	for <lists.iommu@lfdr.de>; Wed, 18 Aug 2021 16:27:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C17780F7E;
	Wed, 18 Aug 2021 14:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMukVA7C-m8e; Wed, 18 Aug 2021 14:27:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 20F6280F7C;
	Wed, 18 Aug 2021 14:27:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4160C000E;
	Wed, 18 Aug 2021 14:27:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C075C000E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 14:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22D604075E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 14:27:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OGrbGoSyfWJB for <iommu@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 14:27:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C9D44075D
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 14:27:21 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E380967373; Wed, 18 Aug 2021 16:27:15 +0200 (CEST)
Date: Wed, 18 Aug 2021 16:27:15 +0200
From: 'Christoph Hellwig' <hch@lst.de>
To: Brian Cain <bcain@codeaurora.org>
Subject: Re: [PATCH 7/7] hexagon: use the generic global coherent pool
Message-ID: <20210818142715.GA10755@lst.de>
References: <20210712061704.4162464-1-hch@lst.de>
 <20210712061704.4162464-8-hch@lst.de>
 <00a901d790af$b05165c0$10f43140$@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00a901d790af$b05165c0$10f43140$@codeaurora.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: 'Vladimir Murzin' <vladimir.murzin@arm.com>, "'Manning,
 Sid'" <sidneym@quicinc.com>, linux-hexagon@vger.kernel.org,
 'Russell King' <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, 'Dillon Min' <dillon.minfei@gmail.com>,
 'Christoph Hellwig' <hch@lst.de>, linux-arm-kernel@lists.infradead.org
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

I've pulled the whole series into the dma-mapping for-next tree.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
