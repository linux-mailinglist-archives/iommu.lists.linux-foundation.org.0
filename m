Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D1A41EEC
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 10:21:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2E8CD179A;
	Wed, 12 Jun 2019 08:21:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 942A31793
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 08:19:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 32B83E6
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 08:19:47 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 7F6AB642; Wed, 12 Jun 2019 10:19:45 +0200 (CEST)
Date: Wed, 12 Jun 2019 10:19:44 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH v2 0/4] iommu: Add device fault reporting API
Message-ID: <20190612081944.GB17505@8bytes.org>
References: <20190603145749.46347-1-jean-philippe.brucker@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603145749.46347-1-jean-philippe.brucker@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: ashok.raj@intel.com, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, alex.williamson@redhat.com,
	robin.murphy@arm.com
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

On Mon, Jun 03, 2019 at 03:57:45PM +0100, Jean-Philippe Brucker wrote:
> Jacob Pan (3):
>   driver core: Add per device iommu param
>   iommu: Introduce device fault data
>   iommu: Introduce device fault report API
> 
> Jean-Philippe Brucker (1):
>   iommu: Add recoverable fault reporting
> 
>  drivers/iommu/iommu.c      | 236 ++++++++++++++++++++++++++++++++++++-
>  include/linux/device.h     |   3 +
>  include/linux/iommu.h      |  87 ++++++++++++++
>  include/uapi/linux/iommu.h | 153 ++++++++++++++++++++++++
>  4 files changed, 476 insertions(+), 3 deletions(-)
>  create mode 100644 include/uapi/linux/iommu.h

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
