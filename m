Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3CDC2D98
	for <lists.iommu@lfdr.de>; Tue,  1 Oct 2019 08:44:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D38BC7759;
	Tue,  1 Oct 2019 06:44:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 66AC87736
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 06:43:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DA77B8AF
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 06:43:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5558A68B20; Tue,  1 Oct 2019 08:43:40 +0200 (CEST)
Date: Tue, 1 Oct 2019 08:43:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH] dma/coherent: remove unused dma_get_device_base()
Message-ID: <20191001064339.GA8582@lst.de>
References: <1568725242-2433-1-git-send-email-cai@lca.pw>
	<1569444877.5576.232.camel@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569444877.5576.232.camel@lca.pw>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: vladimir.murzin@arm.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, robin.murphy@arm.com, hch@lst.de
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

On Wed, Sep 25, 2019 at 04:54:37PM -0400, Qian Cai wrote:
> Ping. Please take a look at this trivial patch.

No need to rush.  We just had the 5.4 merge window closing.  I'll
queue this up in the dma-mapping for-next tree for 5.5 once I open it.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
