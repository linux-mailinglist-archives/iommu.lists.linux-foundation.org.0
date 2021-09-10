Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 43420406A15
	for <lists.iommu@lfdr.de>; Fri, 10 Sep 2021 12:23:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D89C34068C;
	Fri, 10 Sep 2021 10:23:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbnGCXsLQR62; Fri, 10 Sep 2021 10:23:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1244840694;
	Fri, 10 Sep 2021 10:23:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAEBFC000D;
	Fri, 10 Sep 2021 10:23:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10B80C000D
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 10:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED0F180E03
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 10:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IW30XkZDpWbX for <iommu@lists.linux-foundation.org>;
 Fri, 10 Sep 2021 10:23:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EB1580DED
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 10:23:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id BEA7067357; Fri, 10 Sep 2021 12:23:06 +0200 (CEST)
Date: Fri, 10 Sep 2021 12:23:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jeremy Linton <jeremy.linton@arm.com>
Subject: Re: DPAA2 triggers, [PATCH] dma debug: report -EEXIST errors in
 add_dma_entry
Message-ID: <20210910102306.GA13863@lst.de>
References: <20210518125443.34148-1-someguy@effective-light.com>
 <fd67fbac-64bf-f0ea-01e1-5938ccfab9d0@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd67fbac-64bf-f0ea-01e1-5938ccfab9d0@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Hamza Mahfooz <someguy@effective-light.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Dan Williams <dan.j.williams@intel.com>,
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

On Wed, Sep 08, 2021 at 10:33:26PM -0500, Jeremy Linton wrote:
> PS, it might not hurt to rate limit/_once this somehow to avoid a runtime 
> problem if it starts to trigger.

Yes, that might be a good idea.  Care to prepare a patch?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
