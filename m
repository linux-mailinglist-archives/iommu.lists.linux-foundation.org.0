Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F262E41F44
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 10:35:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F1CC717AD;
	Wed, 12 Jun 2019 08:35:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0E1BA179D
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 08:33:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A649F174
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 08:33:31 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id F412164D; Wed, 12 Jun 2019 10:33:29 +0200 (CEST)
Date: Wed, 12 Jun 2019 10:33:28 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v6 0/7] RMRR related fixes and enhancements
Message-ID: <20190612083328.GD17505@8bytes.org>
References: <20190603065336.10524-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603065336.10524-1-eric.auger@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jean-philippe.brucker@arm.com, dwmw2@infradead.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	alex.williamson@redhat.com, robin.murphy@arm.com, eric.auger.pro@gmail.com
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

On Mon, Jun 03, 2019 at 08:53:29AM +0200, Eric Auger wrote:
> Eric Auger (7):
>   iommu: Fix a leak in iommu_insert_resv_region
>   iommu/vt-d: Duplicate iommu_resv_region objects per device list
>   iommu/vt-d: Introduce is_downstream_to_pci_bridge helper
>   iommu/vt-d: Handle RMRR with PCI bridge device scopes
>   iommu/vt-d: Handle PCI bridge RMRR device scopes in
>     intel_iommu_get_resv_regions
>   iommu: Introduce IOMMU_RESV_DIRECT_RELAXABLE reserved memory regions
>   iommu/vt-d: Differentiate relaxable and non relaxable RMRRs

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
