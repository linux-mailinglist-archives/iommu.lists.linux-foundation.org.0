Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9F78353B
	for <lists.iommu@lfdr.de>; Tue,  6 Aug 2019 17:28:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B4873E76;
	Tue,  6 Aug 2019 15:28:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2B65DE5D
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 15:28:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C987C8AA
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 15:28:14 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 4DEA53D5; Tue,  6 Aug 2019 17:28:13 +0200 (CEST)
Date: Tue, 6 Aug 2019 17:28:12 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2] iommu: arm-smmu-v3: Mark expected switch fall-through
Message-ID: <20190806152811.GD1198@8bytes.org>
References: <20190730152012.2615-1-anders.roxell@linaro.org>
	<20190730152600.643mg43y6567pchi@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730152600.643mg43y6567pchi@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: robin.murphy@arm.com, iommu@lists.linux-foundation.org,
	Anders Roxell <anders.roxell@linaro.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
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

On Tue, Jul 30, 2019 at 04:26:01PM +0100, Will Deacon wrote:
> Joerg -- if you'd like to pick this up as a fix, feel free, otherwise I'll
> include it in my pull request for 5.4.

Applied to iommu/fixes, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
