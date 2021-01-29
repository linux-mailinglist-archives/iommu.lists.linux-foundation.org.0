Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0C03086FD
	for <lists.iommu@lfdr.de>; Fri, 29 Jan 2021 09:28:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2EBC886FCB;
	Fri, 29 Jan 2021 08:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ZwBGScNHk3l; Fri, 29 Jan 2021 08:27:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 37F5487052;
	Fri, 29 Jan 2021 08:27:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15D02C013A;
	Fri, 29 Jan 2021 08:27:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41598C013A
 for <iommu@lists.linux-foundation.org>; Fri, 29 Jan 2021 08:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 37E0E87031
 for <iommu@lists.linux-foundation.org>; Fri, 29 Jan 2021 08:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id boerpCTxR1of for <iommu@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 08:27:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9A4B486FCB
 for <iommu@lists.linux-foundation.org>; Fri, 29 Jan 2021 08:27:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 920742D8; Fri, 29 Jan 2021 09:27:52 +0100 (CET)
Date: Fri, 29 Jan 2021 09:27:51 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/2] iommu/ipmmu-vmsa: refactoring and allow SDHI devices
Message-ID: <20210129082750.GS32671@8bytes.org>
References: <1611838980-4940-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611838980-4940-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org
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

On Thu, Jan 28, 2021 at 10:02:58PM +0900, Yoshihiro Shimoda wrote:
> Yoshihiro Shimoda (2):
>   iommu/ipmmu-vmsa: refactor ipmmu_of_xlate()
>   iommu/ipmmu-vmsa: Allow SDHI devices
> 
>  drivers/iommu/ipmmu-vmsa.c | 53 +++++++++++++++++++---------------------------
>  1 file changed, 22 insertions(+), 31 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
