Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A6187E10
	for <lists.iommu@lfdr.de>; Fri,  9 Aug 2019 17:33:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 46459DC0;
	Fri,  9 Aug 2019 15:33:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 204B7DA6
	for <iommu@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 15:33:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A987482D
	for <iommu@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 15:33:45 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 3E5F93D0; Fri,  9 Aug 2019 17:33:44 +0200 (CEST)
Date: Fri, 9 Aug 2019 17:33:42 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v6 22/57] iommu: Remove dev_err() usage after
	platform_get_irq()
Message-ID: <20190809153342.GD12930@8bytes.org>
References: <20190730181557.90391-1-swboyd@chromium.org>
	<20190730181557.90391-23-swboyd@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730181557.90391-23-swboyd@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Tue, Jul 30, 2019 at 11:15:22AM -0700, Stephen Boyd wrote:
> Please apply directly to subsystem trees

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
