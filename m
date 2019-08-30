Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F140A392C
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 16:25:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BF5A96194;
	Fri, 30 Aug 2019 14:25:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7337A616C
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 14:23:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0547E8A2
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 14:23:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 7DC43246; Fri, 30 Aug 2019 16:23:52 +0200 (CEST)
Date: Fri, 30 Aug 2019 16:23:51 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH] iommu/dma: fix for dereferencing before null checking
Message-ID: <20190830142350.GC11578@8bytes.org>
References: <1566611232-165399-1-git-send-email-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566611232-165399-1-git-send-email-linyunsheng@huawei.com>
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

On Sat, Aug 24, 2019 at 09:47:12AM +0800, Yunsheng Lin wrote:
>  drivers/iommu/dma-iommu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
