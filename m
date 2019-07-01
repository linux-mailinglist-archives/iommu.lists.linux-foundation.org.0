Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2341EB2
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 10:12:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7D015178A;
	Wed, 12 Jun 2019 08:12:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 42471177A
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 08:10:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B2C2E174
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 08:10:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id A4896398; Wed, 12 Jun 2019 10:10:51 +0200 (CEST)
Date: Wed, 12 Jun 2019 10:10:51 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: [PATCH v3] iommu/arm-smmu: Avoid constant zero in TLBI writes
Message-ID: <20190612081051.GD21613@8bytes.org>
References: <f523effd-ef81-46fe-1f9e-1a0cb42c8b7b@free.fr>
	<20190529130559.GB11023@fuggles.cambridge.arm.com>
	<84791515-e0ae-0322-78aa-02ca0b40d157@free.fr>
	<09a290f1-27a0-5ee3-16b9-659ef2ba99dc@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09a290f1-27a0-5ee3-16b9-659ef2ba99dc@free.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
	MSM <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	iommu <iommu@lists.linux-foundation.org>, Andy Gross <agross@kernel.org>,
	AngeloGioacchino Del Regno <kholk11@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On Mon, Jun 03, 2019 at 02:15:37PM +0200, Marc Gonzalez wrote:
>  drivers/iommu/arm-smmu.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Applied, thanks. It should show up in linux-next in the next days.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
