Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A332466C6
	for <lists.iommu@lfdr.de>; Mon, 17 Aug 2020 14:59:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 66E368554A;
	Mon, 17 Aug 2020 12:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIi0lig5nM8E; Mon, 17 Aug 2020 12:59:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AF8B585533;
	Mon, 17 Aug 2020 12:59:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4D25C0051;
	Mon, 17 Aug 2020 12:59:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E51C1C0051
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 12:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CA65620381
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 12:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TGgaqmtU3P3E for <iommu@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 12:59:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id DAA052039B
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 12:59:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9FBAAAAB0;
 Mon, 17 Aug 2020 12:59:35 +0000 (UTC)
Date: Mon, 17 Aug 2020 14:59:08 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 00/16] IOMMU driver for Kirin 960/970
Message-ID: <20200817125908.GB4167@suse.de>
References: <cover.1597650455.git.mchehab+huawei@kernel.org>
 <20200817082106.GA16296@infradead.org>
 <20200817112725.26f1b7d6@coco.lan>
 <20200817093703.GA2258686@kroah.com>
 <20200817124617.303bb4a9@coco.lan>
 <20200817105345.GA3483231@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817105345.GA3483231@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxarm@huawei.com,
 Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>,
 Chenfeng <puck.chen@hisilicon.com>, mauro.chehab@huawei.com,
 Suzhuangluan <suzhuangluan@hisilicon.com>,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Aug 17, 2020 at 12:53:45PM +0200, Greg Kroah-Hartman wrote:
> You can always do this just fine, as one single patch.  You do know
> about the co-developed-by: line, right?

Agreed. Please keep the main iommu driver in one patch and use
co-developed-by. This makes it easier for me to review it and provide
feedback. And please Cc me on the whole patch-set for v2.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
