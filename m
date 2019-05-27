Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6322B811
	for <lists.iommu@lfdr.de>; Mon, 27 May 2019 17:01:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B70EE19B5;
	Mon, 27 May 2019 15:01:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1C1BF193F
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 15:00:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ABD0B81A
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 15:00:37 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 99DA0244; Mon, 27 May 2019 17:00:35 +0200 (CEST)
Date: Mon, 27 May 2019 17:00:34 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v4 00/15] iommu/vt-d: Delegate DMA domain to generic iommu
Message-ID: <20190527150033.GC12745@8bytes.org>
References: <20190525054136.27810-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190525054136.27810-1-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, dima@arista.com,
	tmurphy@arista.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
	David Woodhouse <dwmw2@infradead.org>
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

Hey James, Lu Baolu,

On Sat, May 25, 2019 at 01:41:21PM +0800, Lu Baolu wrote:
> James Sewart (1):
>   iommu/vt-d: Implement apply_resv_region iommu ops entry
> 
> Lu Baolu (14):
>   iommu: Add API to request DMA domain for device
>   iommu/vt-d: Expose ISA direct mapping region via
>     iommu_get_resv_regions
>   iommu/vt-d: Enable DMA remapping after rmrr mapped
>   iommu/vt-d: Add device_def_domain_type() helper
>   iommu/vt-d: Delegate the identity domain to upper layer
>   iommu/vt-d: Delegate the dma domain to upper layer
>   iommu/vt-d: Identify default domains replaced with private
>   iommu/vt-d: Handle 32bit device with identity default domain
>   iommu/vt-d: Probe DMA-capable ACPI name space devices
>   iommu/vt-d: Implement is_attach_deferred iommu ops entry
>   iommu/vt-d: Cleanup get_valid_domain_for_dev()
>   iommu/vt-d: Remove startup parameter from device_def_domain_type()
>   iommu/vt-d: Remove duplicated code for device hotplug
>   iommu/vt-d: Remove static identity map code

Thanks for working on this. I think it is time to give it some testing
in linux-next, so I applied it to my tree. Fingers crossed this can make
it into v5.3 :)


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
