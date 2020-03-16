Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AC918681F
	for <lists.iommu@lfdr.de>; Mon, 16 Mar 2020 10:43:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2AD3E8627E;
	Mon, 16 Mar 2020 09:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3yB8EvEmRgJ; Mon, 16 Mar 2020 09:43:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 46FA3861D2;
	Mon, 16 Mar 2020 09:43:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D95AC013E;
	Mon, 16 Mar 2020 09:43:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0923C013E
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 09:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DC25C898CE
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 09:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qW2M+cRwKpL5 for <iommu@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 09:43:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 96F5189803
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 09:43:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3010268CEC; Mon, 16 Mar 2020 10:43:36 +0100 (CET)
Date: Mon, 16 Mar 2020 10:43:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Kevin Grandemange <kevin.grandemange@allegrodvt.com>
Subject: Re: [PATCH v3] [dma-coherent] Fix integer overflow in the
 reserved-memory dma allocation
Message-ID: <20200316094335.GA13435@lst.de>
References: <6b2b656c-33ee-4e02-e687-c71ff43de584@arm.com>
 <20200312154040.17040-1-kevin.grandemange@allegrodvt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312154040.17040-1-kevin.grandemange@allegrodvt.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
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

Thanks,

applied to the dma-mapping tree for 5.7 with minor codingstyle fixes.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
