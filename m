Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4CF41AAE7
	for <lists.iommu@lfdr.de>; Tue, 28 Sep 2021 10:46:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 431A880D21;
	Tue, 28 Sep 2021 08:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pDj7SIRBqVoZ; Tue, 28 Sep 2021 08:45:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6045D80E10;
	Tue, 28 Sep 2021 08:45:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B2BDC000D;
	Tue, 28 Sep 2021 08:45:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 026CCC000D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 08:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D87534018D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 08:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJDb8LTxoOw4 for <iommu@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 08:45:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04D3B4017A
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 08:45:56 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A3F692DE; Tue, 28 Sep 2021 10:45:51 +0200 (CEST)
Date: Tue, 28 Sep 2021 10:45:30 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH,RFC] iommu/amd: Recover from event log overflow
Message-ID: <YVLWKtc3ZaL5fvq9@8bytes.org>
References: <YSEaIloMR1VAMXLo@wantstofly.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSEaIloMR1VAMXLo@wantstofly.org>
Cc: iommu@lists.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Lennert,

On Sat, Aug 21, 2021 at 06:22:10PM +0300, Lennert Buytenhek wrote:
> +/*
> + * This function restarts event logging in case the IOMMU experienced
> + * an event log buffer overflow.
> + */
> +void amd_iommu_restart_event_logging(struct amd_iommu *iommu)
> +{
> +	iommu_feature_disable(iommu, CONTROL_EVT_LOG_EN);
> +	iommu_feature_enable(iommu, CONTROL_EVT_LOG_EN);
> +}

A few more things need to happen here. First of all head and tail are
likely equal when the event buffer overflows, so the events will not be
polled and reported.

And next it is also a good idea to reset the head and tail pointers of
the event log to 0 after the events have been polled.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
