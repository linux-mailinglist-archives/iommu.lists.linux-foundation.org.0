Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4860B56CD69
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65D9B60E4B;
	Sun, 10 Jul 2022 06:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65D9B60E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQSa9w6itGYP; Sun, 10 Jul 2022 06:37:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5C78D60AAC;
	Sun, 10 Jul 2022 06:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C78D60AAC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3151EC007D;
	Sun, 10 Jul 2022 06:37:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76529C002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 09:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E1854119D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 09:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E1854119D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lxB79FQkBiXe for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 09:33:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6388540155
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6388540155
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 09:33:38 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8906567373; Fri,  8 Jul 2022 11:33:32 +0200 (CEST)
Date: Fri, 8 Jul 2022 11:33:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Baolu Lu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 3/4] iommu: remove the put_resv_regions method
Message-ID: <20220708093332.GA28988@lst.de>
References: <20220708080616.238833-1-hch@lst.de>
 <20220708080616.238833-4-hch@lst.de>
 <9e3264ff-c94e-db77-9a29-2d6fd2585c9e@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e3264ff-c94e-db77-9a29-2d6fd2585c9e@linux.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 Will Deacon <will@kernel.org>, David Woodhouse <dwmw2@infradead.org>
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

On Fri, Jul 08, 2022 at 05:00:59PM +0800, Baolu Lu wrote:
> Do we really need to export this symbol? It is not used beyond the iommu
> core code.

virtio-iommu calls it and can be modular.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
