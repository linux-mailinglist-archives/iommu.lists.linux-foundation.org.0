Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AA1352B55
	for <lists.iommu@lfdr.de>; Fri,  2 Apr 2021 16:41:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C689360699;
	Fri,  2 Apr 2021 14:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqdM2ufsJrdM; Fri,  2 Apr 2021 14:41:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0748B60607;
	Fri,  2 Apr 2021 14:41:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7DD8C000A;
	Fri,  2 Apr 2021 14:41:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E54B9C000A
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 14:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4698414F8
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 14:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iEmpX7krJUCU for <iommu@lists.linux-foundation.org>;
 Fri,  2 Apr 2021 14:41:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37739414EF
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 14:41:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E4F6B68BFE; Fri,  2 Apr 2021 16:41:48 +0200 (CEST)
Date: Fri, 2 Apr 2021 16:41:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] dma-mapping: add unlikely hint to error path in
 dma_mapping_error
Message-ID: <20210402144148.GB19219@lst.de>
References: <78757abc-ef8f-9a29-9020-967370eec365@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78757abc-ef8f-9a29-9020-967370eec365@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "open list:AMD IOMMU \(AMD-VI\)" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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
