Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBB6F75F8
	for <lists.iommu@lfdr.de>; Mon, 11 Nov 2019 15:07:09 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B9BCDCAD;
	Mon, 11 Nov 2019 14:07:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7C270CAD
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 14:07:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 11F838AB
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 14:07:04 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 720F2120; Mon, 11 Nov 2019 15:07:02 +0100 (CET)
Date: Mon, 11 Nov 2019 15:07:01 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v3 0/6] iommu/ipmmu-vmsa: minor updates
Message-ID: <20191111140700.GB18333@8bytes.org>
References: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org
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

On Wed, Nov 06, 2019 at 11:35:44AM +0900, Yoshihiro Shimoda wrote:
> Yoshihiro Shimoda (6):
>   iommu/ipmmu-vmsa: Remove all unused register definitions
>   iommu/ipmmu-vmsa: tidyup register definitions
>   iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers
>   iommu/ipmmu-vmsa: Calculate context registers' offset instead of a
>     macro
>   iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
>   iommu/ipmmu-vmsa: Add utlb_offset_base
> 
>  drivers/iommu/ipmmu-vmsa.c | 214 +++++++++++++++++++--------------------------
>  1 file changed, 89 insertions(+), 125 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
