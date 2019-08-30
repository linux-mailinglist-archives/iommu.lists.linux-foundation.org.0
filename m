Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCABA3818
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 15:52:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2ADE86162;
	Fri, 30 Aug 2019 13:52:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DEC805C7A
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 13:50:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7762C7DB
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 13:50:25 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id ECF9520E; Fri, 30 Aug 2019 15:50:23 +0200 (CEST)
Date: Fri, 30 Aug 2019 15:50:22 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3] iommu: revisit iommu_insert_resv_region()
	implementation
Message-ID: <20190830135022.GB11578@8bytes.org>
References: <20190821120940.22337-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821120940.22337-1-eric.auger@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: robin.murphy@arm.com, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, alex.williamson@redhat.com,
	dwmw2@infradead.org, eric.auger.pro@gmail.com
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

On Wed, Aug 21, 2019 at 02:09:40PM +0200, Eric Auger wrote:
>  drivers/iommu/iommu.c | 96 +++++++++++++++++++++----------------------
>  1 file changed, 47 insertions(+), 49 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
