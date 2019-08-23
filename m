Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 300389AA51
	for <lists.iommu@lfdr.de>; Fri, 23 Aug 2019 10:28:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0CFD7D4A;
	Fri, 23 Aug 2019 08:28:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0CD7CC9E
	for <iommu@lists.linux-foundation.org>;
	Fri, 23 Aug 2019 08:28:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AA7B8E6
	for <iommu@lists.linux-foundation.org>;
	Fri, 23 Aug 2019 08:28:04 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 196BE20E; Fri, 23 Aug 2019 10:28:03 +0200 (CEST)
Date: Fri, 23 Aug 2019 10:27:57 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v3] iommu/amd: Override wrong IVRS IOAPIC on Raven Ridge
	systems
Message-ID: <20190823082757.GA24194@8bytes.org>
References: <20190817063502.27311-1-kai.hen.fen@canonical.com>
	<20190821051004.2367-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821051004.2367-1-kai.heng.feng@canonical.com>
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

On Wed, Aug 21, 2019 at 01:10:04PM +0800, Kai-Heng Feng wrote:
>  drivers/iommu/Makefile           |  2 +-
>  drivers/iommu/amd_iommu.h        | 14 +++++
>  drivers/iommu/amd_iommu_init.c   |  5 +-
>  drivers/iommu/amd_iommu_quirks.c | 92 ++++++++++++++++++++++++++++++++
>  4 files changed, 111 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/iommu/amd_iommu.h
>  create mode 100644 drivers/iommu/amd_iommu_quirks.c

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
