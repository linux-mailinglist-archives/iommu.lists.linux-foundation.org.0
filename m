Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AF60B74893
	for <lists.iommu@lfdr.de>; Thu, 25 Jul 2019 09:58:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C5F97DAC;
	Thu, 25 Jul 2019 07:58:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0FF03B7D
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 07:58:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7E6127C
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 07:58:40 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 6739C3D5; Thu, 25 Jul 2019 09:58:38 +0200 (CEST)
Date: Thu, 25 Jul 2019 09:58:38 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH v2 04/19] iommu: Introduce struct iommu_iotlb_gather
	for batching TLB flushes
Message-ID: <20190725075838.GB16597@8bytes.org>
References: <20190711171927.28803-1-will@kernel.org>
	<20190711171927.28803-5-will@kernel.org>
	<20190724071959.GE1524@8bytes.org>
	<20190724074129.6pkcmutsoazrrklq@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724074129.6pkcmutsoazrrklq@willie-the-truck>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vijay Kilary <vkilari@codeaurora.org>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Jon Masters <jcm@redhat.com>, Jan Glauber <jglauber@marvell.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	iommu@lists.linux-foundation.org,
	Jayachandran Chandrasekharan Nair <jnair@marvell.com>,
	Robin Murphy <robin.murphy@arm.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Will,

On Wed, Jul 24, 2019 at 08:41:30AM +0100, Will Deacon wrote:
> There aren't tonnes of (direct) users of the iommu-api, and the additional
> complexity introduced by the 'struct iotlb_gather' only applies to users of
> iommu_unmap_fast(), which I think is a reasonable trade-off in return for
> the potential for improved performance.

Yeah, that is right. From a scalability point of view this is much
better and easier than keeping 'struct iotlb_gather' in the
iommu_domain.

Thanks for the explanation.


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
