Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 474B4D729E
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 11:54:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 92ACF89B;
	Tue, 15 Oct 2019 09:54:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 429FD89B
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 09:54:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A14E66C5
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 09:54:52 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 13C2B398; Tue, 15 Oct 2019 11:54:50 +0200 (CEST)
Date: Tue, 15 Oct 2019 11:54:49 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: iommu: ipmmu-vmsa: Add r8a774b1 support
Message-ID: <20191015095449.GC14518@8bytes.org>
References: <1569310854-37057-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569310854-37057-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org,
	iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro@bp.renesas.com>
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

On Tue, Sep 24, 2019 at 08:40:54AM +0100, Biju Das wrote:
> Document RZ/G2N (R8A774B1) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
