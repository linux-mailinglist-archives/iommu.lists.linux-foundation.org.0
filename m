Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B64A7340256
	for <lists.iommu@lfdr.de>; Thu, 18 Mar 2021 10:47:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDD74605AF;
	Thu, 18 Mar 2021 09:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RYiDeBFl3efJ; Thu, 18 Mar 2021 09:47:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1378660667;
	Thu, 18 Mar 2021 09:47:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D17E2C0001;
	Thu, 18 Mar 2021 09:47:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACB48C0001
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 09:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85CB560628
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 09:47:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76WBW7c0C20R for <iommu@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 09:47:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC3DF605AF
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 09:47:21 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E9BA92D8; Thu, 18 Mar 2021 10:47:18 +0100 (CET)
Date: Thu, 18 Mar 2021 10:47:17 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH 0/3] iommu/amd: Fix booting with amd_iommu=off
Message-ID: <YFMhpWTgKP0pd/r1@8bytes.org>
References: <20210317091037.31374-1-joro@8bytes.org>
 <20210317104850.GB2508995@hr-amd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317104850.GB2508995@hr-amd>
Cc: Joerg Roedel <jroedel@suse.de>, "Du, Xiaojian" <Xiaojian.Du@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Woodhouse <dwmw2@infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Mar 17, 2021 at 06:48:50PM +0800, Huang Rui wrote:
> Series are Acked-by: Huang Rui <ray.huang@amd.com>

Thanks, series is applied for v5.12
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
