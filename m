Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5523825759D
	for <lists.iommu@lfdr.de>; Mon, 31 Aug 2020 10:40:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D15D220784;
	Mon, 31 Aug 2020 08:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ouaav3evgDwF; Mon, 31 Aug 2020 08:40:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D981B20780;
	Mon, 31 Aug 2020 08:40:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB897C07FF;
	Mon, 31 Aug 2020 08:40:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B643C0051
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 08:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 19CE384E38
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 08:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eU02UnZOw7UZ for <iommu@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 08:40:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 936B5857A4
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 08:40:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 76C4168CEC; Mon, 31 Aug 2020 10:40:18 +0200 (CEST)
Date: Mon, 31 Aug 2020 10:40:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Subject: Re: [PATCH v6 0/2] make dma_alloc_coherent NUMA-aware by per-NUMA CMA
Message-ID: <20200831084018.GA903@lst.de>
References: <20200821022615.28596-1-song.bao.hua@hisilicon.com>
 <20200821061918.GA28559@lst.de>
 <05dad074e0624367a3fc0dfd0b96a352@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05dad074e0624367a3fc0dfd0b96a352@hisilicon.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, Linuxarm <linuxarm@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "ganapatrao.kulkarni@cavium.com" <ganapatrao.kulkarni@cavium.com>,
 huangdaode <huangdaode@huawei.com>, "will@kernel.org" <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

This is on my todo list to be applied this week.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
