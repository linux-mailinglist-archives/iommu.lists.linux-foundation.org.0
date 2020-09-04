Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E125B25D56C
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 11:51:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 19C4086DD3;
	Fri,  4 Sep 2020 09:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGd9HQB9fDOm; Fri,  4 Sep 2020 09:51:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A6EC086DB0;
	Fri,  4 Sep 2020 09:51:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93F6FC0051;
	Fri,  4 Sep 2020 09:51:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 639ABC0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4F29F86C78
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 49hOES3cCWLX for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 09:51:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D48E086C71
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:51:21 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 931DF3D5; Fri,  4 Sep 2020 11:51:18 +0200 (CEST)
Date: Fri, 4 Sep 2020 11:51:17 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: Fix NULL pointer dereference in
 dev_iommu_priv_set()
Message-ID: <20200904095117.GQ6714@8bytes.org>
References: <20200903065132.16879-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903065132.16879-1-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Wendy Wang <wendy.wang@intel.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Torsten Hilbrich <torsten.hilbrich@secunet.com>
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

On Thu, Sep 03, 2020 at 02:51:32PM +0800, Lu Baolu wrote:
> ---
>  drivers/iommu/intel/iommu.c | 100 ++++++++++++++++++++----------------
>  1 file changed, 55 insertions(+), 45 deletions(-)

Applied for v5.9, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
