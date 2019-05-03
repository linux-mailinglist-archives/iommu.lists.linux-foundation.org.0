Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B835C12FBE
	for <lists.iommu@lfdr.de>; Fri,  3 May 2019 16:04:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5AC3E3967;
	Fri,  3 May 2019 14:04:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9EE7B395F
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 14:03:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F17E587
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 14:03:57 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 8499E41A; Fri,  3 May 2019 16:03:55 +0200 (CEST)
Date: Fri, 3 May 2019 16:03:55 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 2/7] iommu/dma-iommu: Split iommu_dma_map_msi_msg() in
	two parts
Message-ID: <20190503140355.GC6731@8bytes.org>
References: <20190501135824.25586-1-julien.grall@arm.com>
	<20190501135824.25586-3-julien.grall@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501135824.25586-3-julien.grall@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jason@lakedaemon.net, douliyangs@gmail.com, marc.zyngier@arm.com,
	robin.murphy@arm.com, bigeasy@linutronix.de,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	miquel.raynal@bootlin.com, tglx@linutronix.de,
	logang@deltatee.com, linux-rt-users@vger.kernel.org
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

On Wed, May 01, 2019 at 02:58:19PM +0100, Julien Grall wrote:
> On RT, iommu_dma_map_msi_msg() may be called from non-preemptible
> context. This will lead to a splat with CONFIG_DEBUG_ATOMIC_SLEEP as
> the function is using spin_lock (they can sleep on RT).
> 
> iommu_dma_map_msi_msg() is used to map the MSI page in the IOMMU PT
> and update the MSI message with the IOVA.
> 
> Only the part to lookup for the MSI page requires to be called in
> preemptible context. As the MSI page cannot change over the lifecycle
> of the MSI interrupt, the lookup can be cached and re-used later on.
> 
> iomma_dma_map_msi_msg() is now split in two functions:
>     - iommu_dma_prepare_msi(): This function will prepare the mapping
>     in the IOMMU and store the cookie in the structure msi_desc. This
>     function should be called in preemptible context.
>     - iommu_dma_compose_msi_msg(): This function will update the MSI
>     message with the IOVA when the device is behind an IOMMU.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Eric Auguer <eric.auger@redhat.com>

Acked-by: Joerg Roedel <jroedel@suse.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
