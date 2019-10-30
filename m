Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E480E9940
	for <lists.iommu@lfdr.de>; Wed, 30 Oct 2019 10:36:57 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6D0A8EBA;
	Wed, 30 Oct 2019 09:36:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9D7C8DAF
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 09:36:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 480DC8A
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 09:36:52 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id A6DBB34A; Wed, 30 Oct 2019 10:36:50 +0100 (CET)
Date: Wed, 30 Oct 2019 10:36:49 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v2 0/2]  AMD IOMMU Changes for NTB
Message-ID: <20191030093649.GB7254@8bytes.org>
References: <20191022220121.1120-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022220121.1120-1-logang@deltatee.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B, 
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	Kit Chow <kchow@gigaio.com>
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

On Tue, Oct 22, 2019 at 04:01:19PM -0600, Logan Gunthorpe wrote:
> Logan Gunthorpe (2):
>   iommu/amd: Support multiple PCI DMA aliases in device table
>   iommu/amd: Support multiple PCI DMA aliases in IRQ Remapping
> 
>  drivers/iommu/amd_iommu.c       | 170 +++++++++++++++++---------------
>  drivers/iommu/amd_iommu_types.h |   2 +-
>  2 files changed, 92 insertions(+), 80 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
