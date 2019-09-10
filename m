Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B502EAE53D
	for <lists.iommu@lfdr.de>; Tue, 10 Sep 2019 10:17:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 600E3E77;
	Tue, 10 Sep 2019 08:17:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 66AB1E6C
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 08:17:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1142182B
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 08:17:20 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 8BBE34D9; Tue, 10 Sep 2019 10:17:18 +0200 (CEST)
Date: Tue, 10 Sep 2019 10:17:16 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Adam Zerella <adam.zerella@gmail.com>
Subject: Re: [PATCH] iommu/amd: Fix sparse warnings
Message-ID: <20190910081716.GD3247@8bytes.org>
References: <20190907065812.19505-1-adam.zerella@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190907065812.19505-1-adam.zerella@gmail.com>
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

On Sat, Sep 07, 2019 at 04:58:12PM +1000, Adam Zerella wrote:
>  drivers/iommu/amd_iommu.c      |  4 ++--
>  drivers/iommu/amd_iommu_init.c | 12 ++++++------
>  2 files changed, 8 insertions(+), 8 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
