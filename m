Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D4B20F1B0
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 11:33:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AD5178850C;
	Tue, 30 Jun 2020 09:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OdXMI-72E3YG; Tue, 30 Jun 2020 09:33:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2CAFF884A6;
	Tue, 30 Jun 2020 09:33:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10DACC016E;
	Tue, 30 Jun 2020 09:33:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2EDCC016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A352C215DF
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQSANSn6VByE for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 09:33:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 899322035D
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:33:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 1479826B; Tue, 30 Jun 2020 11:33:26 +0200 (CEST)
Date: Tue, 30 Jun 2020 11:33:24 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [Possible PATCH] iommu/qcom: Change CONFIG_BIG_ENDIAN to
 CONFIG_CPU_BIG_ENDIAN
Message-ID: <20200630093324.GD28824@8bytes.org>
References: <5a663096b489b86472fe3bfbd5138c411d669bad.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a663096b489b86472fe3bfbd5138c411d669bad.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Sat, Jun 06, 2020 at 12:16:17PM -0700, Joe Perches wrote:
> CONFIG_BIG_ENDIAN does not exist as a Kconfig symbol.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> 
> I don't have the hardware, so I can't tell if this is a
> correct change, but it is a logical one.
> 
> Found by a test script that looks for IS_ENABLED(FOO)
> where FOO must also exist in Kconfig files.
> 
>  drivers/iommu/qcom_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
