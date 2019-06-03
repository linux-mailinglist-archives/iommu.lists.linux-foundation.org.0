Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F7032DA8
	for <lists.iommu@lfdr.de>; Mon,  3 Jun 2019 12:18:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D249BB09;
	Mon,  3 Jun 2019 10:18:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D542CAA5
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 10:18:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 538605D3
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 10:18:42 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 147B436B; Mon,  3 Jun 2019 12:18:40 +0200 (CEST)
Date: Mon, 3 Jun 2019 12:18:37 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v4 0/6] iommu/ipmmu-vmsa: Suspend/resume support and
	assorted cleanups
Message-ID: <20190603101836.GI12745@8bytes.org>
References: <20190527115253.2114-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527115253.2114-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>, linux-kernel@vger.kernel.org
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

On Mon, May 27, 2019 at 01:52:47PM +0200, Geert Uytterhoeven wrote:
> Geert Uytterhoeven (6):
>   iommu/ipmmu-vmsa: Link IOMMUs and devices in sysfs
>   iommu/ipmmu-vmsa: Prepare to handle 40-bit error addresses
>   iommu/ipmmu-vmsa: Make IPMMU_CTX_MAX unsigned
>   iommu/ipmmu-vmsa: Move num_utlbs to SoC-specific features
>   iommu/ipmmu-vmsa: Extract hardware context initialization
>   iommu/ipmmu-vmsa: Add suspend/resume support

Applied, thanks Geert.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
