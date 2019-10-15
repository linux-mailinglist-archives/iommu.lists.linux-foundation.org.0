Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE0BD7543
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 13:40:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C4C0BCA8;
	Tue, 15 Oct 2019 11:40:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1BF97C97
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:40:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B607E5D3
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:40:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id E6A532D9; Tue, 15 Oct 2019 13:40:46 +0200 (CEST)
Date: Tue, 15 Oct 2019 13:40:45 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] iommu/intel: Use fallback generic_device_group() for
	ACPI devices
Message-ID: <20191015114045.GJ14518@8bytes.org>
References: <20191004205554.21055-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004205554.21055-1-chris@chris-wilson.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Fri, Oct 04, 2019 at 09:55:54PM +0100, Chris Wilson wrote:
> [    2.073922] DMAR: ACPI device "INT33C2:00" under DMAR at fed91000 as 00:15.1
> [    2.073983] DMAR: ACPI device "INT33C3:00" under DMAR at fed91000 as 00:15.2
> [    2.074027] DMAR: ACPI device "INT33C0:00" under DMAR at fed91000 as 00:15.3
> [    2.074072] DMAR: ACPI device "INT33C1:00" under DMAR at fed91000 as 00:15.4

I think just using generic_device_group() is not enough here. You need
to mach the device-id of the ACPI device with the PCI hierarchy and find
the right group there. You can look at the AMD IOMMU drivers
acpihid_device_group() function for some inspiration.

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
