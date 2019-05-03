Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1B713152
	for <lists.iommu@lfdr.de>; Fri,  3 May 2019 17:38:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B904739F5;
	Fri,  3 May 2019 15:38:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A22043946
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 15:37:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 39A44756
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 15:37:19 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 9260E580; Fri,  3 May 2019 17:37:17 +0200 (CEST)
Date: Fri, 3 May 2019 17:37:16 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Johan Hovold <johan@kernel.org>
Subject: Re: Linux crash when using FTDI FT232R USB to serial converter on
	AMD boards.
Message-ID: <20190503153716.GE11605@8bytes.org>
References: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
	<20190429094847.GI26546@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190429094847.GI26546@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@intel.com>,
	"StarostaCZ@gmail.com" <starostacz@gmail.com>
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

On Mon, Apr 29, 2019 at 11:48:47AM +0200, Johan Hovold wrote:
> So this is a debian 4.18 kernel seemingly crashing due to a xhci or
> iommu issue.
> 
> Can you reproduce this on a mainline kernel?
> 
> If so, please post the corresponding logs to the lists and CC the xhci
> and iommu maintainers (added to CC).

Your kernel is probably missing this upstream fix:

	4e50ce03976f iommu/amd: fix sg->dma_address for sg->offset bigger than PAGE_SIZE

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
