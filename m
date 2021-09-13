Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A33409926
	for <lists.iommu@lfdr.de>; Mon, 13 Sep 2021 18:30:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A45CD600BB;
	Mon, 13 Sep 2021 16:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KqOsUJFtpxDN; Mon, 13 Sep 2021 16:30:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DF9536058C;
	Mon, 13 Sep 2021 16:30:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3753C000D;
	Mon, 13 Sep 2021 16:30:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71121C000D
 for <iommu@lists.linux-foundation.org>; Mon, 13 Sep 2021 16:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51E446058C
 for <iommu@lists.linux-foundation.org>; Mon, 13 Sep 2021 16:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2f1pGCp4SCHu for <iommu@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 16:30:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B2AE600BB
 for <iommu@lists.linux-foundation.org>; Mon, 13 Sep 2021 16:30:49 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 34C5167357; Mon, 13 Sep 2021 18:30:44 +0200 (CEST)
Date: Mon, 13 Sep 2021 18:30:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH v2] dma-debug: prevent an error message from causing
 runtime problems
Message-ID: <20210913163043.GA9401@lst.de>
References: <20210910235337.13172-1-someguy@effective-light.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210910235337.13172-1-someguy@effective-light.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

Thanks a lot.

I've applied this with a little change to avoid breaking up the
printed string into two lines.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
