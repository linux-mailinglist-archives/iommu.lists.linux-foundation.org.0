Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F131020CF25
	for <lists.iommu@lfdr.de>; Mon, 29 Jun 2020 16:22:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A09B585F77;
	Mon, 29 Jun 2020 14:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tSSrEQZ_qPjY; Mon, 29 Jun 2020 14:22:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3824385EEF;
	Mon, 29 Jun 2020 14:22:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C5B4C016E;
	Mon, 29 Jun 2020 14:22:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18F93C016E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 14:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 14F4888797
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 14:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0zKzvrFe4NsM for <iommu@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 14:22:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B15EC884AB
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 14:22:29 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 590416736F; Mon, 29 Jun 2020 16:22:25 +0200 (CEST)
Date: Mon, 29 Jun 2020 16:22:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>
Subject: Re: add an API to check if a streamming mapping needs sync calls
Message-ID: <20200629142225.GA22336@lst.de>
References: <20200629130359.2690853-1-hch@lst.de>
 <b97104e1-433c-8e35-59c6-b4dad047464c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b97104e1-433c-8e35-59c6-b4dad047464c@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jonathan Lemon <jonathan.lemon@gmail.com>,
 bpf@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Magnus Karlsson <magnus.karlsson@intel.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Mon, Jun 29, 2020 at 03:39:01PM +0200, Bj=F6rn T=F6pel wrote:
> On 2020-06-29 15:03, Christoph Hellwig wrote:
>> Hi all,
>>
>> this series lifts the somewhat hacky checks in the XSK code if a DMA
>> streaming mapping needs dma_sync_single_for_{device,cpu} calls to the
>> DMA API.
>>
>
> Thanks a lot for working on, and fixing this, Christoph!
>
> I took the series for a spin, and there are (obviously) no performance
> regressions.
>
> Would the patches go through the net/bpf trees or somewhere else?

either the net tree or (my) dma-mapping tree would be fine with me.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
