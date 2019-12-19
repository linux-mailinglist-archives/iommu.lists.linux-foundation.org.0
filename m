Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAF61265DA
	for <lists.iommu@lfdr.de>; Thu, 19 Dec 2019 16:36:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D1CFA20410;
	Thu, 19 Dec 2019 15:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fflBFjDHo8OE; Thu, 19 Dec 2019 15:36:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A10A321577;
	Thu, 19 Dec 2019 15:36:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 701B9C077D;
	Thu, 19 Dec 2019 15:36:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43B89C077D;
 Thu, 19 Dec 2019 15:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 20FF587E95;
 Thu, 19 Dec 2019 15:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g4n0JTHFILhd; Thu, 19 Dec 2019 15:35:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 557AB87DA6;
 Thu, 19 Dec 2019 15:35:59 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 20A6C431; Thu, 19 Dec 2019 16:35:56 +0100 (CET)
Date: Thu, 19 Dec 2019 16:35:41 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 4/5] iommu: intel: Use generic_iommu_put_resv_regions()
Message-ID: <20191219153541.GA21694@8bytes.org>
References: <20191218134205.1271740-1-thierry.reding@gmail.com>
 <20191218134205.1271740-5-thierry.reding@gmail.com>
 <2b3020a1-221c-f86b-6440-e9ef65f0c12e@linux.intel.com>
 <20191219124747.GA1440537@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219124747.GA1440537@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
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

On Thu, Dec 19, 2019 at 01:47:47PM +0100, Thierry Reding wrote:
> On Thu, Dec 19, 2019 at 09:53:22AM +0800, Lu Baolu wrote:
> > Please tweak the title to
> > 
> > "iommu/vt-d: Use generic_iommu_put_resv_regions()"
> > 
> > then,
> > 
> > Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
> > 
> > Best regards,
> > baolu
> 
> Joerg, do you want me to resend with this change or is it more efficient
> if you fix up the subject while applying?

No need to re-send, I'll fix it up in this patch and in the others too.


	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
