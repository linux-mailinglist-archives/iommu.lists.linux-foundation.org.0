Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E24DE1227B3
	for <lists.iommu@lfdr.de>; Tue, 17 Dec 2019 10:30:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 79978865B0;
	Tue, 17 Dec 2019 09:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 55qPxaRi4DcM; Tue, 17 Dec 2019 09:30:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0DE81858B5;
	Tue, 17 Dec 2019 09:30:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0F1DC1D84;
	Tue, 17 Dec 2019 09:30:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E486C077D
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 09:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E912A204BE
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 09:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7G0ED2zSBhTN for <iommu@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 09:30:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 453E120481
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 09:30:50 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8604D286; Tue, 17 Dec 2019 10:30:45 +0100 (CET)
Date: Tue, 17 Dec 2019 10:30:44 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Adrian Huang <adrianhuang0701@gmail.com>
Subject: Re: [PATCH 1/1] iommu/amd: Treat per-device exclusion ranges as r/w
 unity-mapped regions
Message-ID: <20191217093043.GB8689@8bytes.org>
References: <20191114061447.14604-1-ahuang12@lenovo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114061447.14604-1-ahuang12@lenovo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Adrian Huang <ahuang12@lenovo.com>
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

On Thu, Nov 14, 2019 at 02:14:47PM +0800, Adrian Huang wrote:
> Some buggy BIOSes might define multiple exclusion ranges of the
> IVMD entries which are associated with the same IOMMU hardware.
> This leads to the overwritten exclusion range (exclusion_start
> and exclusion_length members) in set_device_exclusion_range().
> 
> Here is a real case:
> When attaching two Broadcom RAID controllers to a server, the first
> one reports the failure during booting (the disks connecting to the
> RAID controller cannot be detected).
> 
> This patch prevents the issue by treating per-device exclusion
> ranges as r/w unity-mapped regions.
> 
> Discussion:
>   * https://lists.linuxfoundation.org/pipermail/iommu/2019-November/040140.html
> 
> Suggested-by: Joerg Roedel <joro@8bytes.org>
> Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
> ---
>  drivers/iommu/amd_iommu_init.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
