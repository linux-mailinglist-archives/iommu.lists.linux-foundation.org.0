Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 997FB5F45C
	for <lists.iommu@lfdr.de>; Thu,  4 Jul 2019 10:12:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9FF06D0A;
	Thu,  4 Jul 2019 08:12:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 98548C64
	for <iommu@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 08:12:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F2F1A87D
	for <iommu@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 08:12:50 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 6164B2FB; Thu,  4 Jul 2019 10:12:49 +0200 (CEST)
Date: Thu, 4 Jul 2019 10:12:48 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: Re: [Patch v2 06/10] iommu: using dev_get_drvdata directly
Message-ID: <20190704081247.GC6546@8bytes.org>
References: <20190704023620.4689-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704023620.4689-1-huangfq.daxian@gmail.com>
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

On Thu, Jul 04, 2019 at 10:36:20AM +0800, Fuqian Huang wrote:
>  #define to_iommu(dev)							\
> -	((struct omap_iommu *)platform_get_drvdata(to_platform_device(dev)))
> +	((struct omap_iommu *)dev_get_drvdata(dev))

A similar change is already queued for v5.3.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
