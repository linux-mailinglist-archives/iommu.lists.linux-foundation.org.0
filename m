Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F38F542744
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 15:14:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1839E1C3E;
	Wed, 12 Jun 2019 13:14:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D18001C33
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 13:11:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9C91E79
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 13:11:45 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 9C2EF64D; Wed, 12 Jun 2019 15:11:43 +0200 (CEST)
Date: Wed, 12 Jun 2019 15:11:43 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH v2 0/4] iommu: Add device fault reporting API
Message-ID: <20190612131143.GF21613@8bytes.org>
References: <20190603145749.46347-1-jean-philippe.brucker@arm.com>
	<20190612081944.GB17505@8bytes.org>
	<0f21e1b2-837f-87ba-6cf3-f6490d9e2a57@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f21e1b2-837f-87ba-6cf3-f6490d9e2a57@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "ashok.raj@intel.com" <ashok.raj@intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	Robin Murphy <Robin.Murphy@arm.com>
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

On Wed, Jun 12, 2019 at 12:54:51PM +0100, Jean-Philippe Brucker wrote:
> Thanks! As discussed I think we need to add padding into the iommu_fault
> structure before this reaches mainline, to make the UAPI easier to
> extend in the future. It's already possible to extend but requires
> introducing a new ABI version number and support two structures. Adding
> some padding would only require introducing new flags. If there is no
> objection I'll send a one-line patch bumping the structure size to 64
> bytes (currently 48)

Sounds good, please submit the patch.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
